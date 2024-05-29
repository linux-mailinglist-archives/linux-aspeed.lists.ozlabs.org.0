Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 8E02A8D2C5B
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 07:21:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cBCP8gOa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpyGf2W9dz3fs7
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 15:14:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cBCP8gOa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpyGP4Dgrz3fmX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2024 15:13:49 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 354BC2014A;
	Wed, 29 May 2024 13:13:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959627;
	bh=h4M8rZbowMLRerjP3q6tibaxSn7JV3KdcB7/Gsd+7Sg=;
	h=From:Subject:Date:To:Cc;
	b=cBCP8gOaeRVNkWdCtFQ7WeZ9NFuk53Mx0bIwLpK+nUMuLbR9+YC260XEDN0pyOtkV
	 WM41jOPl5V+cuTf5P5Gdq0LCD2IIjzAbtcqyPhdfCr4OIdz9kyfxPWzCGs24Y3hBGW
	 ZvA7L0tBX8sCwGMWnotaDdUIptUkoKLmiAHqY/XwV5aBtnY7N7MpWuMO14TExcM0dG
	 afMnV6n5tZkIN/ANFVZ1FEFD/jw3tnBng22BejSAI/Hr2WbT4ORO+G0j1hWvUH0XpF
	 uRM2vQjV3+RxF8a6uJrvPwWidNTsZNYv7sRmpv6dIm0Yz8Ph+MnwsPaz5byrJjAX0Z
	 xO70/T6yc/bIg==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/4] dt-bindings: gpio: aspeed,sgpio: Miscellaneous
 cleanups
Date: Wed, 29 May 2024 14:43:19 +0930
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+5VmYC/x2NQQqDMBAAvyJ77kIaahG/Ij2kyZouyBp2Uy2If
 2/wMjCXmQOMlMlg7A5Q2th4lSb3WwfxEyQTcmoO3vmH6/2AqeIeVFiyYS68ol1kqaT6LRUjLYv
 hc+iDozn56N7QYkVp5t81ml7n+QeTDH4eeAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This short series fixes some SGPIO-related devicetree warnings currently
emitted by `make dtbs_check` for Aspeed devicetrees.

One change documents `#interrupt-cells` and a subseqent change makes
it required. The property should have been both documented and marked
as required from the start. As the change is technically not backwards
compatible, I've split it such that we can debate the required status
separately.

Please review!

Andrew

---
Andrew Jeffery (4):
      dt-bindings: gpio: aspeed,sgpio: Order properties by DTS style
      dt-bindings: gpio: aspeed,sgpio: Specify gpio-line-names
      dt-bindings: gpio: aspeed,sgpio: Specify #interrupt-cells
      dt-bindings: gpio: aspeed,sgpio: Require #interrupt-cells

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240528-dt-warnings-gpio-sgpio-interrupt-cells-685a0efd2c0b

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

