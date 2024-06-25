Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE24916862
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:51:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bLOV/bbB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7l854rjtz3fqr
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:51:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bLOV/bbB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7l801SpSz3fnh
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:51:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719319827; x=1719924627; i=markus.elfring@web.de;
	bh=GP4e83RetXmJ+nltZzrhj+9THBjb5nLvKFN3CPJMaWA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bLOV/bbBaWS3wIqBQYYU/Q5fIXDY63gr6FeZGiQNjoSWuXXimje9UyfXgFj17IoJ
	 F0fVWUO2JN7zmItAYaFwAUdEWY4oCfaAMSlHbnulv8WKMBTjJf0IWVJutigIjlaRk
	 +Q/lx+lRmBHLTg7Os25TT4PyWwWQbH0xUEOTk7S6JXjLEVGOeCXgfHC/e1Vjf4Xb9
	 eiMPlcIqqCYUqhcDCeJ07Mwj/wkk0o76AJGgB97EKitpkJMaNuYPZ23byxw6+EjRL
	 695dCvhTDz5LcINg9KkpVeVq6qQesvrAd/zNX6WpwgEp5KgCqH42bSBMIjQnYAbiC
	 wgl42SnfUE97l6kRoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCXVX-1sCyxN3sgt-002KoM; Tue, 25
 Jun 2024 14:50:26 +0200
Message-ID: <ff2aaf0d-5456-43d1-af52-78986b3401f9@web.de>
Date: Tue, 25 Jun 2024 14:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240625022306.2568122-1-make24@iscas.ac.cn>
 <edeaa699-7cfe-44ed-abde-7cf3d3efe3bf@web.de>
 <2024062556-ladder-canister-1ab1@gregkh>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2024062556-ladder-canister-1ab1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FNTukBhZ3B3+L6KuC7iGVDq29cjxKUdvTe6S+6DCxRUr493OjeI
 dwv07Dl+WluHsC4py8Nurc/rjD8qeTXlJZWxhnwmLYlNt17nlv/pfEIeVUsgOiQCIADdcQt
 EtbSh42+SEXWgTkkOl96N92sqqK9pfunMONEeVBLllZIq35OFLtPhaVKw2K1PhPc6USKukk
 MKt3B0Gy2xDc88WHr6l9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:78rG0XbaWo4=;wDrWYhO2AA9czDYUVFTiVxvQhfn
 uUSuGNaMrOtcLDI0AkgykBTy7upRcIe9t6ZARxvSSrd2gf6wQb1Qwcqrc6fmAaemA9DeScFj1
 2PF881Ex0qhoTOwZN7hBwUvVwNsq9G8vvvJvqD061B3F5T5F5FAiT9dbib7di5HY2adHWewMH
 FppItD/sU5xXQfy71Ayn4PtxIyDqgOTPAHj+LNApKvNH4lKuqiBWmHBEjgbi1ciTojpyEjOjb
 oZcJivvLHuc9C3MJB7OjQ3duMCIunrsJ1l4q2qpfpNnTSeOPHXnKJupwUb6/8qXrtX6vsY34y
 YOqIRV5x9k3BpbISh7WrPycLStVSu4OszeSKD1xk1v3WS9O6KoN2t+QCrXVbJGFoDDSOjA7pl
 aktMXFxSE5bbUkteNqBPAlcR3dRAHXRAaTD2Z3RTdLnAlcyvOxxAt47rCfPPRQ0c6RslkUvDN
 Gtut4eK0T+KVuD72GkoCUfw4LVurjvcm5kHH+Z4Gv7NG+n2pIQT02IzzLW25/WVq3t70ARe1k
 FRrALs7Zzh0bvIfp1SKPlZ1Zck5Npvtyb+l5bVKS+Pi3GAcunQUnaFJSANw7VISiZ6mmcknIe
 Sv5v68GQzEDFBRKM3E4htOFBFacVRjjsvay+aHFnk/9P/yJ6VdXqdnfdAHDfdyeSyou8NZv3B
 ECdAC9ccsw0YGSM5bhAWoxskGECc2VjU9TDW2r+s0IcCTZWfzQYx7I1U6m9v7W2m/MrYMKUfX
 mhvfgeUxlHbMmh96uS4Eg9EOSLv3q22pQxqavTbGlhh9BmnXUvJ9FJfp2V6TtbGyJbLbkUaFQ
 wEOu6WgZfw5HIAL7keSgTUFk96w/cagvjrHahKlqVEols=
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
Cc: Ma Ke <make24@iscas.ac.cn>, Neal Liu <neal_liu@aspeedtech.com>, Lee Jones <lee@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>>> We should verify the bound of the array to assure that host
>>> may not manipulate the index to point past endpoint array.
>>
>> Why did you not choose an imperative wording for your change descriptio=
n?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.10-rc5#n94
>
> Markus, please stop reviewing USB patches.  This is not helpful at all,
> and causes new developers extra work for no reason at all.

How does this feedback fit to the linked information source?

Regards,
Markus
