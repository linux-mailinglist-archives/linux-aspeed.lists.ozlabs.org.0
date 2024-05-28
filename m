Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9B08D1E4B
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 May 2024 16:16:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zz6MeVHO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpZ9n05DCz79TK
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 00:08:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zz6MeVHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpZ9g1W60z79Rl;
	Wed, 29 May 2024 00:08:22 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SDkCCF020629;
	Tue, 28 May 2024 14:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=lWIMffnrRym7lthZshb5Xf1FQB1FEORLfXmQXGWGktM=;
 b=Zz6MeVHOhmDIbKwO10xp6W5bwhsmVcacoUj3e+HkEB7ofPwxpMNajcC/EL8V0LKBMqvS
 ciU+60BG0AsscHG3Z4zEB5m3X+ArSfd0uCpK3fQz0534rOyRyqn3bh/Na8Ov26CEbgW3
 GiyXKQPCmFAXdd4nmGDvoeNgM8D/XvtkBx6pLOaL4l2cyJgPlVzgJSiRhdSgRj5hT06J
 IMtoeI+HTn9YlaYQ6nvxDQwg1R/nP89B6IS0UkGiizLeM0lzdxcUN1lFXxMTYxopvyN0
 bw0vg9iIGTwwSUspXgvBMktLJ2GpNRLjJvSG040hSK/GEtdS2eD/sGZ8XMP7NUfw2x2b 9g== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydf6jgavy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:08:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SC0AfC006684;
	Tue, 28 May 2024 14:08:06 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ybtatffya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:08:06 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SE83EC37093662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:08:05 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A044B58063;
	Tue, 28 May 2024 14:08:03 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A82658067;
	Tue, 28 May 2024 14:08:03 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:08:02 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------vJ7uAXedVsqwd4eG70aPp9ug"
Message-ID: <3ac517f0-0394-4310-8840-d806de5ec082@linux.ibm.com>
Date: Tue, 28 May 2024 09:08:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/20] ARM: dts: aspeed: Add IBM P11 Fuji BMC system
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-17-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-17-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wF5Lhm_U45_VCP1HApXu1a9W-za7S4wn
X-Proofpoint-GUID: wF5Lhm_U45_VCP1HApXu1a9W-za7S4wn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280106
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
--------------vJ7uAXedVsqwd4eG70aPp9ug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eddie,

> +
> +		led@6 {
> +			reg = <6>;
> +			default-state = "keep";
> +			label = "opencapi-connector5";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
is led@7 not connected?
> +
> +		led@8 {
> +			reg = <8>;
> +			default-state = "keep";
> +			label = "vrm4";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +
> +		led@9 {
> +			reg = <9>;
> +			default-state = "keep";
> +			label = "vrm5";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +
> +		led@10 {
> +			reg = <10>;
> +			default-state = "keep";
> +			label = "vrm6";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +
> +		led@11 {
> +			reg = <11>;
> +			default-state = "keep";
> +			label = "vrm7";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +
> +		led@12 {
> +			reg = <12>;
> +			default-state = "keep";
> +			label = "vrm12";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
curious about label jump from vrm7 to vrm12.
>
> +			cfam4_i2c10: i2c-bus@a {
> +				reg = <10>;	/* OP3A */
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> It will be more readable to have "reg" value in hex too. I have seen similar stuff in this FSI nodes. It will be consistent with other places.
> +

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>




--------------vJ7uAXedVsqwd4eG70aPp9ug
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="white-space: pre-wrap">Hi Eddie,</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-17-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">+
+		led@6 {
+			reg = &lt;6&gt;;
+			default-state = "keep";
+			label = "opencapi-connector5";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};</pre>
    </blockquote>
    is led@7 not connected?<br>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-17-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
+
+		led@8 {
+			reg = &lt;8&gt;;
+			default-state = "keep";
+			label = "vrm4";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};
+
+		led@9 {
+			reg = &lt;9&gt;;
+			default-state = "keep";
+			label = "vrm5";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};
+
+		led@10 {
+			reg = &lt;10&gt;;
+			default-state = "keep";
+			label = "vrm6";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};
+
+		led@11 {
+			reg = &lt;11&gt;;
+			default-state = "keep";
+			label = "vrm7";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};
+
+		led@12 {
+			reg = &lt;12&gt;;
+			default-state = "keep";
+			label = "vrm12";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};</pre>
    </blockquote>
    curious about label jump from vrm7 to vrm12.<br>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-17-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

+			cfam4_i2c10: i2c-bus@a {
+				reg = &lt;10&gt;;	/* OP3A */
+				#address-cells = &lt;1&gt;;
+				#size-cells = &lt;0&gt;;
+
It will be more readable to have "reg" value in hex too. I have seen similar stuff in this FSI nodes. It will be consistent with other places. 
+
</pre>
    </blockquote>
    <p>Reviewed-by: Ninad Palsule <a class="moz-txt-link-rfc2396E" href="mailto:ninad@linux.ibm.com">&lt;ninad@linux.ibm.com&gt;</a></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------vJ7uAXedVsqwd4eG70aPp9ug--

