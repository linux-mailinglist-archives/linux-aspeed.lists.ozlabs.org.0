Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF49996AF3
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 14:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNtG06gwQz3bhD
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 23:57:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728478647;
	cv=none; b=QKl+P4CX1FZwwOcyzECdC4h7xAv1cTkTTHqEONDb/zfOI4nCC+0T5+Wh+UoZD6M3zygrDAumcxBL9xClYxYZlHi1NXoEzxdcT6qQ6z+brtcvqJriVgB5zbFSAUn3abJX1H2gXRv/8oak1lYxh/iYTl1FXx2XfNo3LjOrqYxcXH8O+gJ3FbA7ZzG/czp3E2qEl2hkwm3cDbcavyIFHrrDv3TI0spimj+PMSLr4Rl5MQNV2vEktW06Hzdw3ZpEAV/EeIRdwgtcwJWAJ7Dnj9NV0/f2R9dkbwlRcyEZxPO3WGeogjEs0r7qipA9aolmHivwQXO7lnOsXSaVAhlwLnc+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728478647; c=relaxed/relaxed;
	bh=12KnPFDUcHIAcww2+I8DcbudLGNI7zh4KnfAgouCgWo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YlmabclX5z7DLvTa6nzCO4rRxkfd1kQ/RHK5agSP/SJqBg6sgJdFQNh4ZJ7BiHiMKD/DR/RmRyLArYgzJkdJrHU+yoJKVD//nb7ux3/L4/lAIapwOMz2+XYwpDnYPunGjahIeFuooFcD8uknDiI41JB6NtCXen1OVGnK6ZKx7isVgA7Wnr9Ck/mbm1C99zOpK+u5RF8upmoKGdxmaZOZNsCYlEoQU4VPflgXAPXYS9AS+OfLX6BiOUHGps1SWZVP3lPI/itrwVFPIKoJQFwGxNEYMmfSBfxmNZ7Yn9vRCU5H9Wza9AGlYqRu6ZXzo5tfNbW9rt/6bUFNQ3BVb+qAcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lEaGy5bf; dkim-atps=neutral; spf=pass (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lEaGy5bf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNtFx4rnhz3bbS
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 23:57:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728478589; x=1729083389; i=markus.elfring@web.de;
	bh=12KnPFDUcHIAcww2+I8DcbudLGNI7zh4KnfAgouCgWo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lEaGy5bfWxQswVAdhsDpDFkkTIqJmEzFyphANNLMR99hGQtrGL/+rEGlQd/7Qbzw
	 fNEilCw/jJrohMNMY/HHRNDoObod6goOPC8iCuQpEWv0cSOYAKPU5UHI1GWNLReOb
	 O9PfaeRWKbDMVK+rHpmXexd6QSVkbe/qazG46GBpFfI+OPhsAZQJJf4pyxQrVELV+
	 pGgLriBBvn7lyAewdfkYl7pkVCVJdwRzMfJ0j5PvrwZCd0oQbjsWJ9vf/mhWvQhB5
	 BzQ+1fjT2wJJGPsoldWR5xZwCEjz8Qj45kOOZy9+LyposQn+ZiIO1uHaFLTjGJlVE
	 C+rY2F5q4bdoMT77ZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2jWK-1tzEjB1B3E-012VnT; Wed, 09
 Oct 2024 14:56:29 +0200
Message-ID: <f972f6bf-fd76-45c7-9812-3adfb49264a0@web.de>
Date: Wed, 9 Oct 2024 14:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kevin Chen <kevin_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20241009115813.2908803-2-kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add support for
 ASPEED AST27XX INTC
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241009115813.2908803-2-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QPSId2FJjr8d/zGGwvi81dsHFZUVZrokECT2AEGipMXrJZRxCIP
 bh3fhkQnkfTo042vGl7scsgu4wmtzSpeMZTTvFZhdT2a3fY4Z0LXQILqu+YjcZ+vyhEwB4E
 NyZvcpSOs4PrkbI+7V7jHrmCKsEQc4AIPB+vld+JUCtC3m8u25GlaNbeiI+B6vH6UmnroGw
 qjP3A2mTy4yHv/i/8XmJw==
UI-OutboundReport: notjunk:1;M01:P0:MlHg9LH74c4=;p7TF+U+OKTfvFWA5a7gk23ZDyeR
 2+1U3vUasDEAR3q/+qpuNYUbHl5LhBayl3vU/15fV6c7ysSWWOxOyN9vlqcB/4Ojw/W+ccf9O
 0RecdolgzKkbpmJgCWl8OyStzBkWV5MAIS901CIHgIYQzeTnonVXxVJjrVzb2vQysqW1TIy9a
 q7pO4lOxW5JJ0FiihNrfWPTECEPbLQdTlCuKAv6281QxJxsC82X06sJ1ABWEncBujjF9pRIxw
 LR4tQcGMdV72pQKluwc1MJ0jselMonPN+7+G/z3l5gw4q4wdRcFsN3ZRldGWwOvKu90ciPuvN
 WTAMY6sXIZTHz3FLFBDoSG34xrzj08xP/ft9WpHyKcm88FL1HStldSyPUSOuntbC2kMEkcMkt
 P+xYkKX470kVJJUpLwcwzVRULuBQy/e5JFYWLKC3GBZmWWVHYS3IOcYWy1Be40Qsnq7sDPkfU
 48jzvfeScAd88Hyb11t6h16Dtm8B39tkKs51M/SrGbQnOWgL7JR+ZKJ3NoZ283tLLuE6uj9+u
 cojdxFYEgdSDYO/taVjovqF3nhqNSmf5Jz7uZtGp/Dw1zitm+JjQ1dag+8URqKr3nXSLmKTac
 sLq20YRbaJsdo7nKiAVox27kwG1/0C8EM2PMlP/a3+B6Be4/60yO2G7mgqZyjALSd4EurARbh
 bCqt7VM0vI/4//uCfyhhrK4vm3xOpj3p/vATYkey320ZprrV8u89zSCxWbZvI+rlIPRdyVOwE
 NFUUDyx7HLejwMEA460uT5BC1GIo4lUQnJndHSyJpRC7pRoWf/GcPHGf5KDcFdWmnFeYO4vwk
 OxFXE12YxJWviBvqijPEf4iw==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> The ASPEED AST27XX interrupt controller(INTC) contain second level and
=E2=80=A6
                                                contains?

=E2=80=A6
in INTC1 asserted. There are 6 GIC interrupt number(#192~#197) used in
=E2=80=A6
                                             numbers?


Regards,
Markus
