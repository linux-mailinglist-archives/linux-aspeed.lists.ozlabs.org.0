Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D03D35D9
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 09:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMD73PTCz30Fv
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 17:59:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=WDJa/1k/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UpxeDh9C;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=WDJa/1k/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UpxeDh9C; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMCv6rf8z301k
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 17:59:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D53FB581634;
 Fri, 23 Jul 2021 03:59:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Jul 2021 03:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=i8n9O+VsqDFXRYu9i7jNYyfCIp
 o8E9ZNcVeUyjwI2Ik=; b=WDJa/1k/SAJzvrhFOqBLwsyjc6kmpqly5/dkJBtjQZ
 Zja0AAC84IaQutQjU8Veo7ApUPkfH7EG0A1NZ6FwPLunySo1OMyzH5hb5px4v+c8
 +JtQaeILb/fBKsHsMstZvyrcJVqV7lU3i6GVhjCitIc4u7PdNnl5Gz4ZVZqBNrCq
 575LR3f7/SHGSJLbtaQGbALuIQb5DkNdNFoXl0SCpIGKQevdn9Tdutg94FF+qRE1
 qjnZq6AcOELPGWrj6Xfs05fRlSy+dzwexmzRDl6/U0RVeHjOs9jZ9LAJDwHJv+eB
 Qflw4Ju7tpiCCuB9JXkbRff8I2QTcq4sSQ1482BA7+ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=i8n9O+VsqDFXRYu9i
 7jNYyfCIpo8E9ZNcVeUyjwI2Ik=; b=UpxeDh9CqUezIsciiyfavfJ8qQP0tAUzi
 5MK0L6nKjDHMorgD0BJTkv5CvukVgu5sAnj67Hm+gw6R7eBf7+/t1GLkXiUddU5X
 R+Vg5N5SvUTaz6T5ZtIbmDp6++2CHrmXqQMgg+zxckh6b0R8e1LoFOsuCFAd5r93
 /ozXWevK0lfvdqENXkht5E5qpzs29x2fCnSE5i9+lvm0gtGr8EWHNLZKcDC/dNZU
 QUHq0x56Rk3RMBX+fSncMbzcYZWWgPtlcPDzT0HVEjfeFLw8jMH8/kBaatE2jH0I
 BzgAFmjZKWWQdHZcymo+rkgpSp6Rc754nxtDyyDhJLh88iFeewllg==
X-ME-Sender: <xms:1Hb6YKxKzE6oWPgAt3wxPx_ePnTVw65uMxWyjfb74LMBTtoboyzgEQ>
 <xme:1Hb6YGRvmF6sN0qIhy8d_3fP8hfZKopJHFtaWKJHJS4jkYBM4-8yM5lJ0nZ0GsjVH
 sllybRhJaTPoO1T9g>
X-ME-Received: <xmr:1Hb6YMWdi5oqbexFkX3zGmJ7AyiVONBMX8yIIW9zO2aBPTqp848t0q-Waq_xZsAXE5MuyDJsIMbktTCjRaK12240qHdp15iRg1FPDHjPMOaVZIdxVMKHM7Y1h3nzZzP_0ECJuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:1Hb6YAiXsMlpzjcmikp88F-5EU14M9ob02JGSwzOUJuI5KRDQMDzIg>
 <xmx:1Hb6YMBChe99RClN0kXm6hfefuXxkVb0AQ4kjQO7p_qQ5N-cn1GmPA>
 <xmx:1Hb6YBKInD8nvE6qLjUqrwTk1d7TaJ7DJXhx0qS-eQqg5JSzIP5FAg>
 <xmx:1nb6YMuJuSNLRfysgLt8Gbbhvqr359rqDYzESyJJdrCS5TtjHkq9GQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 0/6] leds: Fix pca955x GPIO pin mappings
Date: Fri, 23 Jul 2021 17:28:52 +0930
Message-Id: <20210723075858.376378-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 clg@kaod.org, pavel@ucw.cz, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series does a bunch of crimes, so it's an RFC. I'm cross-posting to the
pinctrl/GPIO and LEDs lists because the PCA955x devices impact all of them. What
needs fixing is the leds-pca955x driver's failure to map the GPIO numberspace to
the pin numberspace of the PCA955x devices. The series solves that by
implementing pinctrl and pinmux in the leds-pca955x driver.

Things I'm unsure about:

1. Patch 1: The pinctrl_gpio_as_pin() API feels a bit dirty, not sure what
   others thoughts are on that (Linus?).

2. Patch 2: I've added a new callback to hook the entirety of the pinctrl map
   parsing rather than supplying a subnode-specific callback. This was necessary
   to handle the PCA955x devicetree binding in a backwards compatible way.

3. Patch 4: The PCA955x devices don't actually have any pinmux hardware, but the
   properties of the pinctrl/pinmux subsystems in the kernel map nicely onto the
   problem we have. But it's quite a bit of code...

4. Patch 6: I also lost a bunch of time to overlooking the get_group_pins()
   callback for pinctrl, and it seems odd to me that it isn't required.

Please review!

Andrew

Andrew Jeffery (6):
  pinctrl: Add pinctrl_gpio_as_pin()
  pinctrl: Add hook for device-specific map parsing
  leds: pca955x: Relocate chipdef-related descriptors
  leds: pca955x: Use pinctrl to map GPIOs to pins
  ARM: dts: rainier: Add presence-detect and fault indictor GPIO
    expander
  pinctrl: Check get_group_pins callback on init

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  76 +++
 drivers/leds/leds-pca955x.c                  | 554 +++++++++++++++----
 drivers/pinctrl/core.c                       |  28 +-
 include/linux/pinctrl/pinctrl.h              |   4 +
 4 files changed, 566 insertions(+), 96 deletions(-)

-- 
2.30.2

