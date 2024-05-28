Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 491C78D1EE0
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 May 2024 16:31:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ma43W4ww;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpZXT1rX3z79Vj
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 00:24:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ma43W4ww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpZXD5YTyz3vXX;
	Wed, 29 May 2024 00:24:28 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SEGYLk022267;
	Tue, 28 May 2024 14:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=IB23AGEf0U57w69GCkyfpviq3E3QyJ3Q3o3tiaM7BhQ=;
 b=Ma43W4wwt0GTe4IsKhGkC080e1bO7x0KtNizojijHDVKP9WK0hURkqdqgRMjVUXo3pe3
 CtvOEl6Q1Rvjlh81+M/aGF+wjBfDbOY8pS/yH2IOjP/O62tZ/IVnPyyzPvWeR42RxYzl
 aZW6fIznJU5IEHJYtJiD0xo+gtLo1Ft4vtGNMafJFsHstus2kjEKkpvG5pYfL/DifNnQ
 q4Kjrs7a4z5gqtorwJU50D5p+owFMIz4Zi8CDxk+6rvlsqpSfIicdZPio8IOoC7efrJI
 08F+cvo2MQIqcOUyaDX/1qrAdYtRLGMZ3PPUkrLZgTi3DLoCl4JzDtN++yYIcyXS+Jci QQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydgvtr0cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:24:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SB0QfZ027260;
	Tue, 28 May 2024 14:22:50 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ybvhkpwyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:22:50 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SEMltr26214864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:22:49 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B8715806A;
	Tue, 28 May 2024 14:22:47 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B87858056;
	Tue, 28 May 2024 14:22:47 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:22:47 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------lWFZQfEqWsT1nnpyr6FELHax"
Message-ID: <15a55baa-f560-4745-9850-72b1aedcc910@linux.ibm.com>
Date: Tue, 28 May 2024 09:22:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/20] ARM: dts: aspeed: Add IBM P11 FSI devices
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-14-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-14-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 639ORYGJMXoJX9hOcEfB59PIgpEVOBQp
X-Proofpoint-GUID: 639ORYGJMXoJX9hOcEfB59PIgpEVOBQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=903 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280108
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------lWFZQfEqWsT1nnpyr6FELHax
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eddie,

> +			cfam0_i2c11: i2c-bus@b {
> +				reg = <11>;	/* OP3B */
> +				#address-cells = <1>;
> +				#size-cells = <0>;
It will be nice to have reg value also in hex for easy ready.


Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>


--------------lWFZQfEqWsT1nnpyr6FELHax
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Eddie,<br>
    </p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-14-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">+			cfam0_i2c11: i2c-bus@b {
+				reg = &lt;11&gt;;	/* OP3B */
+				#address-cells = &lt;1&gt;;
+				#size-cells = &lt;0&gt;;</pre>
    </blockquote>
    It will be nice to have reg value also in hex for easy ready.<br>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-14-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Reviewed-by: Ninad Palsule <a class="moz-txt-link-rfc2396E" href="mailto:ninad@linux.ibm.com">&lt;ninad@linux.ibm.com&gt;</a></p>
    <p><br>
    </p>
  </body>
</html>

--------------lWFZQfEqWsT1nnpyr6FELHax--

