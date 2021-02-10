Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAC31651B
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 12:24:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbHTs2B80zDr8g
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 22:24:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b/zbpErG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbHRt655zzDvXp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 22:22:47 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11ABDxgm009743; Wed, 10 Feb 2021 06:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=YVMpVG4LKFgL08kmNc5BRgSzjodlXOlJ+4DMpYvx3mQ=;
 b=b/zbpErGAl41fiSscQwv5Yxt0LuBh20vIusB9vlxJwg5Wtk6Esh/2JWL1JGBWgO3KKmB
 DBpRDlkbNc0GmYLRcENpl2fU4Ua9s1cpvLTHA9JU5NdBWOTqzwZHoS5yX8zy5RwZlqr0
 PyM6SI6TOGC6uwdmHE4oGo6BIRC4VgkkVOzBGDQx55rqUDWIpKZRRecM4B2qgAYmzAEF
 ajaigwEQKxcjnEb06Ag9cgQJfbt6CJG1WbUctUh9nk/2doe7UAIjUJXa855Xqt2E7NxO
 4wkruw3inNR5BSGlgMJiMj0y77w9A4oi1IF07/1STQgFgL3pbH57DBKzG7BPpGxiZXkv Uw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mee5g7ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 06:22:44 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11ABIIxt017991;
 Wed, 10 Feb 2021 11:22:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 36hjr7te73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 11:22:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11ABMdaE3474092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 11:22:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E2CD5204E;
 Wed, 10 Feb 2021 11:22:39 +0000 (GMT)
Received: from [9.85.100.242] (unknown [9.85.100.242])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 458B852054;
 Wed, 10 Feb 2021 11:22:38 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 3/6] ARM: dts: aspeed: rainier: Add leds that are off
 PCA9552
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <CACPK8XdcUyw4st2Et2W0o95sdGOvGNuyoemgt_dUzrS3dYuRcg@mail.gmail.com>
Date: Wed, 10 Feb 2021 16:52:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6AF74EB2-0010-4BD6-ADB0-D8B9D11C9F7B@linux.vnet.ibm.com>
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-3-git-send-email-vishwa@linux.vnet.ibm.com>
 <CACPK8XdcUyw4st2Et2W0o95sdGOvGNuyoemgt_dUzrS3dYuRcg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_03:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=985
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100108
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
Cc: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



> On 16-Nov-2020, at 11:44 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
> <vishwa@linux.vnet.ibm.com> wrote:
>>=20
>> These LEDs are on the fans and are connected via a
>> PCA9552 I2C expander
>>=20
>> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>> ---
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 36 =
++++++++++++++++++++++++++++
>> 1 file changed, 36 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index 1da7389..b7d7246 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -173,6 +173,42 @@
>>                        default-state =3D "keep";
>>                        gpios =3D <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
>>                };
>> +
>> +               fan0 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 0 GPIO_ACTIVE_LOW>;
>=20
> Does it make sense to rename the pca0 phandle to something more
> descriptive so it isn't confused with other expanders? If you want to
> do that please send a follow up patch.


pca0 was something that was already existing before I made the change. I =
just referenced it.


>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
>=20
>> +               };
>> +
>> +               fan1 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 1 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               fan2 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 2 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               fan3 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 3 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               fan4 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 4 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               fan5 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 5 GPIO_ACTIVE_LOW>;
>> +               };
>>        };
>> };
>>=20
>> --
>> 1.8.3.1

