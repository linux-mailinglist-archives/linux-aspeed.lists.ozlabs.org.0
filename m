Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 70B098CDB21
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 21:56:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=pMfisWgZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VldxH3BJDz78sG
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 05:47:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=pMfisWgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 37052 seconds by postgrey-1.37 at boromir; Fri, 24 May 2024 05:47:23 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vldx76tfHz3wCp;
	Fri, 24 May 2024 05:47:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716493610; x=1717098410; i=markus.elfring@web.de;
	bh=k8z0la8swt9SpoVjei6Q7ijAcgG0toE8rzl/jMTWN4g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pMfisWgZWnM/FhOvo+nCi4UgD2gjh4QYro+wIQfjQ6UmLzBAZ91xT1pj0Coigcqg
	 CuEGj1wiMtz0KkCHOLsyiaSeeD1UZfCn+rYYOyjcpBkRJnVOujBdm5PPxPSmGXjbW
	 ml/HbAGEzV6UL/wahCJ7VpFR8r7GKsgjRi6SvI6722a/wEP7VSIkjuMYW3tyge1dq
	 NSGctsigu8U6npwFkYf+j14DeyFONdumyeWLF/42I5lX2yBQhzcKMdsLyJL9V6XK/
	 GrxgE2e+lfx4KDnX7gyn4IZD/JzjmxWXrRiT+zsd5FaO+KPbYy8jG+b8698cAY56w
	 fIo4nfd8cxVsn8PtEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9cLf-1sdb9L2own-00rL0H; Thu, 23
 May 2024 21:46:50 +0200
Message-ID: <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
Date: Thu, 23 May 2024 21:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Conor Dooley <conor@kernel.org>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
 <20240523-rinse-sturdily-7c78d8517884@spud>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523-rinse-sturdily-7c78d8517884@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SRij6pkqI20XtlliJG2+Lw9Htp2ddj0ws5B/QnwTrN4rEaLguRq
 k9T8nfUjiOTpzukcFHBskiQjrdTNIxhPIdXp0JiHSIAnmBYkRaU5KIuOCmdJVqOTR0fmzLl
 WU8b8xY2+2hLy2uvH0TyrTEBzLckvOriX4k/fHVFBwGgSaJ/0GMM6U+qo2HWpYQKGVFcXvf
 qlxx+y9bRqPXoZrvicqUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A+jf93/BvYk=;zOpRYljYPtdE2TlyksJhOK+SzJk
 Eo8dsQz2052UZrZdjf9QZfwsSkWJaU9jvAb/dkILP6LA8vDT2EGojhHixsYUxJqKQZO8SBpXi
 a/RghEvNCtpuRxWqEJAbqXPrM3aSl0vH2IIxOMu1XLIf6HOU2tl7nxHsHnfh8pyuKQ3nMK2mM
 4i6e91+qNKH5ZYGjDyNul8odIWh4515fZhRwW97B/vAO8iM8f2OGZxJKT9hA3GL++/s/zXCVu
 GwZH5t+8f1ewsmKFbOEwrtHVXdup1+VCHMw3kLeyCAUBA8L4NXNrkPFJp7xN6qCDcemTALJac
 Eyv+8JOSzpHmLL3iGv3EZ6b+5RDLvunNHC5TWjN0gnnfODhWLddkbhPOGIbVXLXIpg3VKDBV4
 EkJjWu1+X9OK7/NJ0pgji1b4xhz+tXRF8xuKwCFg9unbuAHb0f1TItkUR69Bf0dL03WcS7Y4+
 IDrr1qSDkEFlS3ARU+kBtu4pBsy5O3LsJbrpurPIUX0hie3fRQuzR9lQQ5vxYQF+F6cyS2i5H
 kQR24V9Kx7O9qEXukqyxT2q31NgydK6bC2WJkfygeuAqa4boDF9VtK29WekPDkMTTY5aw7hHf
 TPtbGWwIpAQQ5EeMicBbPMrRUBw/CLVpkVCEc15AeIwaB7lbqss/cqAWYeGLKXydZsNXMiDOs
 rVVAwdbSDKPYN2UCwHSVA8lUvKuqpUnEuSFhUK/KKMbOvuSnIJ+ZTsBnSMRPAFbAzHXqcY/7s
 I7+tA4K15YKNYW+Sx8wUbwIWA9lDN+nKHJPAJx88Svb2Fhi+gCv+ol2dtKbqYvTgJWE3dNsBr
 o4LOqX+AgzbFfQ4q5eB2xCZus4ZUxdU83PdXoiB82E3cQ=
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

>> Would you like to mention in the changelog that a hardware description
>> should be extended anyhow?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.9#n94
>
> You are talking absolute crap here. Stop harassing contributors with
> your inane comments.

Why do you interpret my patch review contributions in this direction
when the official Linux development documentation provides special advice
on affected wording details?

Regards,
Markus
