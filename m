Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C33948134DE
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 16:35:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XwjCrVD/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srbym4g2Lz3cXq
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Dec 2023 02:35:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XwjCrVD/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srbyg0vYHz3cVH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Dec 2023 02:35:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEFW6Vo010365;
	Thu, 14 Dec 2023 15:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=L/ve6YvU//yFlBn2lmIsmFmAv1mrLVrfzMtE874dy74=;
 b=XwjCrVD/tcub69LPnxozh1nRa9yPxGoYov3sHuGAEhfghwQFtPj4bWIvTyOROEYHhFcE
 8ci2pL+xYQROzSQUZU1/kf5ABaoO7MQg9ZEWWEG638W1g8efGxBnBAaD42A8Y0AB5spF
 mj+GfwwyooDYH5tEUhlxrNdUifh2ta8w4buLtTnsPVI2b2Gr9bGWVgumU+bGGHqIdw7K
 Lv8E8blf7WxgJ/L3pZiRuS35uKJ6J7s0MJeOeazTyhvpXgf8VeSqJYAq1CgwAkPqkAeH
 Kq6HdcOrjDPRoGkaesqULTO4tVTiVzNtYAckiUpQR5KJ8DzCvwv1m1YIVS3bxFt6iBC2 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v04ea824t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 15:34:46 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BEFYawe017843;
	Thu, 14 Dec 2023 15:34:46 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v04ea824c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 15:34:45 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEETnXW013878;
	Thu, 14 Dec 2023 15:34:44 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw592gw0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 15:34:44 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BEFYhJT47120750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 15:34:43 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DED058065;
	Thu, 14 Dec 2023 15:34:43 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8379D58056;
	Thu, 14 Dec 2023 15:34:40 +0000 (GMT)
Received: from [9.67.23.198] (unknown [9.67.23.198])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 15:34:40 +0000 (GMT)
Message-ID: <d8b5df1c-c732-4cf3-ae28-cc2017d3b0b6@linux.ibm.com>
Date: Thu, 14 Dec 2023 09:34:39 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-3-ninad@linux.ibm.com>
 <20231212-amusement-elevation-28e42bcccc35@spud>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20231212-amusement-elevation-28e42bcccc35@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hogr06fT5Mw5qJW3QkIJJvD-IOfJs-Zl
X-Proofpoint-ORIG-GUID: UmYUUzzx44Lo6i8qLBzL1okG6XCyDP4W
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_10,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312140109
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Conor,

On 12/12/23 11:14, Conor Dooley wrote:
> Hey,
>
> On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
>> From: Johannes Holland <johannes.holland@infineon.com>
>>
>> Add a dt schema to support device tree bindings
> "Add bindings for..."
Fixed.
>
>> for the generic I2C
>> physical layer. Refer to the TCG PC Client Platform TPM Profile (PTP)
>> Specification for TPM 2.0 v1.04 Revision 14.
>>
>> This includes descriptions for the Nuvoton and Infineon devices.
>>
>> OpenBMC-Staging-Count: 3
> I have no idea what this is, but it needs to be removed from the patch.
Removed.
>
>> Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   .../bindings/security/tpm/tpm-tis-i2c.yaml    | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
>> new file mode 100644
>> index 000000000000..de1e34065748
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/security/tpm/tpm-tis-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: I2C PTP based TPM Devices
>> +
>> +maintainers:
>> +  - Johannes Holland <johannes.holland@infineon.com>
>> +
>> +description:
>> +  Device Tree Bindings for I2C based Trusted Platform Module (TPM).
> s/Device Tree Bindings for //. Doesn't dt_binding_check now complain if
> you have this in a title or description?
Fixed.
>
>> +properties:
>> +  $nodename:
>> +    pattern: "^tpm(@[0-9a-f]+)?$"
>> +
>> +  compatible:
>> +    oneOf:
>> +      - description: Infineon's Trusted Platform Module (TPM) (SLB9673).
>> +        items:
>> +          - const: infineon,slb9673
>> +          - const: tcg,tpm-tis-i2c
>> +      - description: Nuvoton's Trusted Platform Module (TPM) (NPCT75x).
>> +        items:
>> +          - const: nuvoton,npct75x
>> +          - const: tcg,tpm-tis-i2c
>> +      - const: tcg,tpm-tis-i2c
> IMO this should be removed and this fallback should only be used in
> combination with device specific compatibles, like you have here for the
> infineon and nuvoton devices.

As Guenter mentioned I need to keep it as tacoma board is just using 
this string.

Thanks for the review.

Regards,

Ninad

>
> Cheers,
> Conor.
>
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      tpm@2e {
>> +        compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
>> +        reg = <0x2e>;
>> +      };
>> +    };
>> +...
>> -- 
>> 2.39.2
>>
