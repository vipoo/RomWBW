͕CLRDIR Version 1.2 April 2020 by Max Scane

$͢:� � ��:� �Aڍ�ҍ2�:� �::� ���4:� �-:� �D�z>2����T��>2�2��͕Test option selected. No disk writes will be performed 
$���Y>2�:�����=P�� �$:�O �q>�ʍ�d:��k:���Íͬ:�����!2�:����$��*�+"�|��$}��$͕Directory cleared. $�
�  ^#V�"��	 :��y ^#V�^#V#�"��#####^#V#�"��####^#V�"��:��#~2��*�"�!  "�*�#����"�:��:������"������"�:��*���"������"��7?|g}o�͕Drive: $:��A�>:��͕Sectors Per Track: $:���:����͕Directory Size: $:���:����͕Track Offset: $:���:����͕Sectors to write: $:���:����:��͕Sector size code: $:�����*�#"��*�|��}��!  "�*�#"��>� !�w#�������{:���N*�MD*��ͯDMͅ͙���{:���N*�MD͏*�MD*��ͯDMͅͣ�>T�>:�*��|���}��*�MD͏> �>S�>:�*��|���}����	� �  �~#��$��Õ� |���}�1�2͕CP/M 3 Detected
$�͕MP/M Not Currently Supported 
$�  ���������0�:���_� �� �>�>
��: 2�2�2�2�2�2�2��͕Warning - this utility will overwrite the directory sectors of $͕Drive: $:��A��͕Type Y to proceed, any key other key to exit. $��Y�͕Usage: CLRDIR <drive> [-D, -Y]
Clear the directory sectors of the specified drive.

Options:
-D  Enable debug output.
-Y  Do not ask for confirmation.
$�  :���ù:�����:���ÿ:���ü:����� :�����:������ � �! �$ �' �* �0 >	��>
��>��>��>��>��>��2"`i"bk"2� �� �         Invalid drive specified.
$Invalid option specified.
$
Directory NOT cleared.
$Sector sizes > 512 Bytes not supported.
$                   