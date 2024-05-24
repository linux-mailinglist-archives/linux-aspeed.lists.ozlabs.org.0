Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id AA01A8CE12A
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 08:51:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=YNhq0mjV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlwX86BQxz78pV
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 16:45:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=YNhq0mjV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 350 seconds by postgrey-1.37 at boromir; Fri, 24 May 2024 16:45:03 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlwWz1SZBz3vvv;
	Fri, 24 May 2024 16:45:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716533090; x=1717137890; i=markus.elfring@web.de;
	bh=Umioa2mJKM7ga4XuEYMOnM1K4xmUwt4dK5hfLV9jtS8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YNhq0mjVVy4kHJrjsqkmwUpj33WNMgkg/bp4KBNgJcJKcZtz2zDvX4KgAIU/VfC/
	 48VALHzU4EjWEUzDz5g3ycVgBId1B7UB9AAYmipdY1egQRuO3nrORqiMKWRqNcUBL
	 6QDyv32z+kACTOfPO+lRpERwHpRZbf/VTlLGsqqUC/IB9n7nE6/9dqm8YzkWGDriN
	 VAfPAd9nh9JatqEuuAS2DvzKiqN6lU58JDDR14OMBUcWnmv8icd0+UDimGH0MIoXD
	 16yQvUm7JeLxnX05KZKGFfcwqaw9w22hugRuDgwv2O4e+jFNdTMyCfas8JgEBLdm8
	 CTwdl2Q1+KjYLDu2qQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjBRZ-1sggNX0bbB-00eylk; Fri, 24
 May 2024 08:38:22 +0200
Message-ID: <8a92a08c-2a57-454d-a7ff-3edb3528b78e@web.de>
Date: Fri, 24 May 2024 08:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Al Viro <viro@zeniv.linux.org.uk>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
 <20240523-rinse-sturdily-7c78d8517884@spud>
 <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
 <20240523203339.GS2118490@ZenIV>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523203339.GS2118490@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r06ohMYipjx7MaDK2OvRnKAwkIBVsS5fvyAmsplcvM21XF7HMAm
 A0Src/BHL8flyhJsz3MdFdif8NmB9aq/3fPsFxXcV0kugN2P4baA5bybyQbqJ/d6dNe9V+y
 KfQwRn3SQK5W6mReVOGkQ2OSBIazmuosZVNLZ33w5EUM3wEEBDegS2xAFsb1BzNwauzEvv0
 3DSCxroZyv2XOPlUjbbcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qMLJQzZk8TE=;9nnZUK9NoENpLHev9dyDKkkherV
 H0mZ6/dDNUOVsr1FJlcSMwwJdML35nmcs1y55FkyepHW1vLUk9+irPQHsN3GB+fVKyh0EKo68
 iUWPe1xUSkHT0Ulfd3z8OtjYqVykV1o/QDlaNz3ojf0JebTByNByCUihhqj2o9FskR/XVQ1zS
 BmgNtiw80S0PvTnMaL7kYCVR2GLaFhQeSQB3D8NGhDBIjbXj5APN2D4Vv8/x+8Ppqq+WzZE8T
 539idicxBLSmJlcc0zpupdPH294vmG+ZRXvEHS9UE6FGhElHQ4zZgY8uk6Oi16wv2n8efT/5Q
 7Jktelu0h7VwABLYJtgw0S8J8urxC9gbxB+TK2xF0T6pdBe9rTA4jjmYIYlK5goz3zOd9+tM5
 xcogTBFlw+qVhrJcwwTfNfkUYDLqGq4F5+MDL0hpasb7+1T5zj24I2Ti8DaLrIGnhU8gefqli
 4pxZtl+K8M0TXHN2Vy5yqncQxtROeTCP3ibmTdXtnwwtL2i76nv5XF9TGJ7M+l6tcmqKYBwv1
 rrqhLzW1r7D/feof2GxtUUgLOeixsfyWKO16eYAbkTBbLkkuQ6ylhHLf0LDAO+FAhhfnzxYI4
 bc90vPpdrC+GcblXTMwlFSNkbHYDA//aix8tbFEM8wACPsBvi4/+oy8g3BoVJ/L9BPL0DuJHm
 SIfN4vI21V2n1aJ3byiPkDuF1U3R6ByqcPqW54BhZ8tFoA/B5D4RK5dmG0jfm8XXuVdb0ye+5
 iO3xW0W8M7T/hEvJF5SrJG7qwaQZEs9littwMugdd3PApRjD9GdVIas4D9FUHHfCf4g48o7Ez
 XiDtyjLYQZwCIkZh+w1jyp01B6nUkcCCag6HZVA9FCS6w=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>> Why do you interpret my patch review contributions in this direction
>> when the official Linux development documentation provides special advi=
ce
>> on affected wording details?
>
> Your "contributions" are garbage in general,

My contributions are also varying (as usual) through the years.


>                                              and this thread is not an e=
xception.

It is just another example for involved communication challenges.


> More specifically, you are picking an advice

Some development activities are reminders according to known information s=
ources.


>                                              that is inapplicable,
> transforming it into a question and "contributing" the result.
>
> And your entire modus operandi fits that pattern - you spew random garba=
ge and
> expect the contributors to spend their time and efforts on checking if y=
our
> (contents-free) "advice" happens to make any sense.

Do you express special concerns here which can be reconsidered because of
advices and requirements from software development guidelines?


=E2=80=A6
>                           Unfortunately, the kernel development is clear=
ly
> not among those.

How does such a view fit to an other data representation?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=
=3Dauthor&q=3DElfring

Regards,
Markus
