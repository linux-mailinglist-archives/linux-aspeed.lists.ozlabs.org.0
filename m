Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A7F2B29
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:47:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z8z25pTzDr0f
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:47:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.194;
 helo=mail-lj1-f194.google.com; envelope-from=mazziesaccount@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476mT43jwzzF4tJ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Nov 2019 21:42:32 +1100 (AEDT)
Received: by mail-lj1-f194.google.com with SMTP id y3so21242806ljj.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Nov 2019 02:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zJQtw6WsLKIdVwDZMV0Pz6fU4JFtWwFkbgS9iv+/IOA=;
 b=nMviDITHO1jfvXdT+fq282M2nB3myokay5E6vuH1Fq1ogqFQ7OWhady2FM75jbMAxB
 RGluvTzPnKgKWhEaFUpR5Ka5Sxv15BPT6t87f7SUBRHAdArMY115UqtelHvZoeAh+HvH
 Jarw0K2uqnp/xMAU4anobNbSeOcZQcMyaDYFHfEo/04xS3iryF8kwnzi/Gb+CeiRp+oj
 f6TfzHTSgZwsyTPUJrJf38xOYRWseuBPkxSq2p7ihOc+hTG4IHdgsngrKDUG0J4hnylJ
 AJNY0xkSCnH9Vx8X5mRmYtLxZju1pZPdV/l6eGmA2H8+ipNXJpfuJbKb5LdVVlQ6Qw7f
 RuaQ==
X-Gm-Message-State: APjAAAUQuq1nRPhNiKOofoq0mvnDzGqBpES/B7xoX8NMlLWyCUQNRa2s
 +T82Ju4R6StZFCs+5kwd2Xw=
X-Google-Smtp-Source: APXvYqwOFSWIOcTngdfrUrZTLUT1vT2lZ4x7hyEHAU08t2ea6kvg8p56NtVIkvH7brQqOjIrQEACtw==
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr22778902ljk.81.1572950548332; 
 Tue, 05 Nov 2019 02:42:28 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id z22sm8386482ljm.92.2019.11.05.02.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:42:27 -0800 (PST)
Date: Tue, 5 Nov 2019 12:42:21 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH 62/62] gpiolib: Nag for INPUT direction values other than
 GPIO_LINE_DIRECTION_IN
Message-ID: <06aa0acec5797fc5711354d8ecad18bc6e947122.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:02 +1100
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
Cc: Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nandor Han <nandor.han@ge.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

It seems that bunch of drivers put some effort (namely use !! or ! when
converting GPIO direction register value to direction) to only return 1
or 0 for direction INPUT/UOTPUT. Others do just return any positive value
they happen to read from register for INPUT. Let's try iron out this habit
by nagging if our cool new definitions GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT are not used.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpiolib.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 104ed299d5ea..ed292498afb6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -226,6 +226,12 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	ret = chip->get_direction(chip, offset);
 	if (ret > 0) {
 		/* GPIOF_DIR_IN, or other positive */
+		if (ret != GPIO_LINE_DIRECTION_IN) {
+			struct gpio_device *gdev = chip->gpiodev;
+
+			dev_warn(&gdev->dev,
+				 "drivers should use GPIO_LINE_DIRECTION_IN\n");
+		}
 		ret = 1;
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
@@ -1389,12 +1395,18 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	for (i = 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
+		int dir;
 
 		if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
-			if (!chip->get_direction(chip, i))
+			dir = chip->get_direction(chip, i);
+			if (!dir) {
 				set_bit(FLAG_IS_OUT, &desc->flags);
-			else
+			} else {
+				if (dir != GPIO_LINE_DIRECTION_IN)
+					dev_warn(&gdev->dev,
+						 "drivers should use GPIO_LINE_DIRECTION_IN\n");
 				clear_bit(FLAG_IS_OUT, &desc->flags);
+			}
 		} else {
 			if (!chip->direction_input)
 				set_bit(FLAG_IS_OUT, &desc->flags);
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
