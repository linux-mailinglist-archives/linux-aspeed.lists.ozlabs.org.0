Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 332BA8CEC87
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 May 2024 00:56:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVnfUsoH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmKvR0kyfz79RB
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 May 2024 08:48:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVnfUsoH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmKvF1lHXz79Nr;
	Sat, 25 May 2024 08:48:08 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OMf8Q1007804;
	Fri, 24 May 2024 22:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=mhbBQ+85RV9y7E+fb0dyxwUOMN7Byx+BVqUy0+Mwf4s=;
 b=HVnfUsoH4a3Vp/ZRFDICpqdEgv+ONA5kRGYJZ9D48NW5Cs0vepXn9MM7LcPuDMgTx05b
 vAj2UcbbKLPfWOuoihByGcrlTGLAmOMTdaGzEpXetZUUgNxJnHECadMe0PcO8+8Jj4kO
 3vD79t4jQ3v5R8Hfm3+Qz3Jbe7Vd41MBtR12NSY5Tk1Qr/+9bybjD7ZcbUsBst5r1eK5
 m02pLLmMZhnIBmrhxxNMql9QM+PwlWsC1mgSr6cOLA3ZQkVXtdGpm3TjYsHuWTSbu+DI
 K4kgD6L3EAkMPGzjqzOyEUat0C1J0+dKR7J1pC/WXdZ7Kl5wSpwFItSUWGfjDN4F5o86 Ww== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yb3ufg17k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 22:48:00 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44OKEN13007424;
	Fri, 24 May 2024 22:47:59 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y79c3k1fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 22:47:59 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44OMluSN44368156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 May 2024 22:47:58 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F25C15805C;
	Fri, 24 May 2024 22:47:55 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6826758054;
	Fri, 24 May 2024 22:47:54 +0000 (GMT)
Received: from [9.61.107.154] (unknown [9.61.107.154])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 May 2024 22:47:54 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------08ML0l6qf0iVkTgnQk4XFX8u"
Message-ID: <dca4ac91-c18b-4271-a3f9-fbf3b5a3c43d@linux.ibm.com>
Date: Fri, 24 May 2024 17:47:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/20] ARM: dts: aspeed: Add IBM P11 Blueridge BMC
 system
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-15-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-15-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kM9TbIap5j0zdomURdGLwBRfGRMQtDT3
X-Proofpoint-GUID: kM9TbIap5j0zdomURdGLwBRfGRMQtDT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=919 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405240165
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
--------------08ML0l6qf0iVkTgnQk4XFX8u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> +		led@6 {
> +			reg = <6>;
> +			default-state = "keep";
> +			label = "cpu-vrm1";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +
Is there a specific reason for skipping led@7? Its not connected?
> +		led@8 {
> +			reg = <8>;
> +			default-state = "keep";
> +			label = "lcd-russel";
> +			retain-state-shutdown;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +	};
> +

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>


--------------08ML0l6qf0iVkTgnQk4XFX8u
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-15-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">+		led@6 {
+			reg = &lt;6&gt;;
+			default-state = "keep";
+			label = "cpu-vrm1";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};
+</pre>
    </blockquote>
    Is there a specific reason for skipping led@7? Its not connected?<br>
    <blockquote type="cite"
      cite="mid:20240522192524.3286237-15-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
+		led@8 {
+			reg = &lt;8&gt;;
+			default-state = "keep";
+			label = "lcd-russel";
+			retain-state-shutdown;
+			type = &lt;PCA955X_TYPE_LED&gt;;
+		};
+	};
+
</pre>
    </blockquote>
    <p>Reviewed-by: Ninad Palsule <a class="moz-txt-link-rfc2396E" href="mailto:ninad@linux.ibm.com">&lt;ninad@linux.ibm.com&gt;</a><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------08ML0l6qf0iVkTgnQk4XFX8u--

