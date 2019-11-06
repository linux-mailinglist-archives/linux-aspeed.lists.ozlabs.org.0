Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A533F2B5A
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:50:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477zCf61zYzF6Hy
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:50:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.67; helo=mail-lf1-f67.google.com;
 envelope-from=mazziesaccount@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Kz34DmqzF5fh
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 19:51:59 +1100 (AEDT)
Received: by mail-lf1-f67.google.com with SMTP id q28so17429178lfa.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Nov 2019 00:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S0olsl6U+J7JDQ22nIhebd59focLW5rDuobD1hUdq5I=;
 b=LKarWKGK5vLlbBKuOuIbztCRNDaG/T9yMbfcADfuS1t0qs7nuKi7UjxCRU1fCRL5yR
 Hvs4tWmOFVeJM1CE+nJxJDtK2C1MlUwoZ5vHu/1RVEaAxilL3CHXVq+qcChgThYuOFN2
 TSe6m37eCDEFb9E8bvzfMFUcZjB74fTbSMwktYBdZSsl7DEzYht3mZETpE/Ro9fQxp/y
 Ny8uONGTD50Hk1PMu5T0HTm2qKE20u43Y7wpH/g1vFa7YBVRexzf7rhMhSFpe3FSFkhl
 6WXVbLL+2lfIM8G5jhF8IdFHPQSTtBQWGBRQKSvJ/3+OyrXuBcnNrhlXlhb7N+XRduqg
 J+3A==
X-Gm-Message-State: APjAAAVzsUfExXQlLTH2n4rU0sjxfrecZEyyRxSRwHcWRznwqp8DDX6D
 ga+LxR5BdFbPhxVyBuu1beY=
X-Google-Smtp-Source: APXvYqzDio4qZlOISjr6MeUpYA9Mauudh6cLHNIHVHIEV0v296IjktNY6fM6+w+eUpFaURqfUCi8NA==
X-Received: by 2002:a19:c790:: with SMTP id x138mr23827081lff.61.1573030315542; 
 Wed, 06 Nov 2019 00:51:55 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id v203sm10763661lfa.25.2019.11.06.00.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 00:51:55 -0800 (PST)
Date: Wed, 6 Nov 2019 10:51:47 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH v2 1/2] gpio: Add definition for GPIO direction
Message-ID: <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:03 +1100
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
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
 Sascha Hauer <s.hauer@pengutronix.de>,
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

At least for me it is difficult to remember the meaning of GPIO
direction values. Define GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
not need to always check the meaning of hard coded values 1 and 0.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes from v1: No changes.

 include/linux/gpio/driver.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5dd9c982e2cb..cc9ade4552d9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -22,6 +22,9 @@ enum gpio_lookup_flags;
 
 struct gpio_chip;
 
+#define GPIO_LINE_DIRECTION_IN	1
+#define GPIO_LINE_DIRECTION_OUT	0
+
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
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
