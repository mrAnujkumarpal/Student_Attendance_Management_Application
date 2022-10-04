<script>
    document.querySelector('#from1').onsubmit = function (e) {

        $flag = $(this).attr('data-flag');

        if ($flag == 0) {
            e.preventDefault(); //to prevent submitting

            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes, I am sure!',
                cancelButtonText: "No, cancel it!",
                closeOnConfirm: false,
                closeOnCancel: false
            },
                    function (isConfirm) {

                        if (isConfirm) {
                            swal("Shortlisted!", "Candidates are successfully shortlisted!", "success");

                            //update the data-flag to 1 (as true), to submit
                            $('#from1').attr('data-flag', '1');
                            $('#from1').submit();
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
        }

        return true;
    });
</script>