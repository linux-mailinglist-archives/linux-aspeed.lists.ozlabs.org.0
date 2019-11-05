Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E4F2B20
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:47:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z8D59ThzF6KD
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:47:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.68; helo=mail-lf1-f68.google.com;
 envelope-from=mazziesaccount@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476ll15sK6zF3WW
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Nov 2019 21:09:29 +1100 (AEDT)
Received: by mail-lf1-f68.google.com with SMTP id j14so14642605lfb.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Nov 2019 02:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=zk3Bb9MrnjOf99XNcjG+7oLOCBcvmwvMNgAHxWKOa5c=;
 b=Mwg2NLAWLug5fnzU/WQXnsW06UZUE+BKI/p2SLnd44Js0cDZ6LT2LJv7H7hyS1koei
 55xTXkYG2GyWrjiG8NbDYCU9q/N3Dm5UUVbTv/UZA/7WpdyEXrdDDHfSswxN9FQtF3/y
 m/Ob1AaCzoS7QMTthcNHEvV1DmaFz9mFilNow+bTlMAh3gS1bwfRzoZRZbyUJl74fKim
 tbmAw6gG+90aaXQ+ZfpI5UOrq7RgQOg1A6RZdRty6HuV/CKEFXbA+cc4liMC+kWQI2db
 pv2SE668ngnC8TUlQweGWd31rp9yF9JkrZ+KjtSA5Cc5PyJHe93qddWrg53rMuG2ze9Q
 8CNw==
X-Gm-Message-State: APjAAAVfmzZv2S0seqptVDrKMqSMmUhlWNOXXaeHx2PV6qwQRJyoohYi
 S/0cjPN8nxyLB+34yHkEfr0=
X-Google-Smtp-Source: APXvYqyBwgy1vqbuJGpl9AzCkQnGaEwRpvBUoN2XJ8vBJuigeUtT9eRmIbLOdes7+Mmv8dp9zewfFw==
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr20278721lfc.34.1572948565410; 
 Tue, 05 Nov 2019 02:09:25 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id c14sm8834917ljd.3.2019.11.05.02.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:09:24 -0800 (PST)
Date: Tue, 5 Nov 2019 12:09:10 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH 00/62] Add definition for GPIO direction
Message-ID: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The patch series adds definitions for GPIO line directions.

For occasional GPIO contributor like me it is always a pain to remember
whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging the
fact that I removed few comments like:

/* Return 0 if output, 1 if input */
/* This means "out" */
return 1; /* input */
return 0; /* output */

it seems at least some others may find it hard to remember too. Adding
defines for these values helps us who really have good - but short
duration - memory :]

Please also see the last patch. It adds warning prints to be emitted
from gpiolib if other than defined values are used. This patch can be
dropped out if there is a reason for that to still be allowed.

This idea comes from RFC series for ROHM BD71828 PMIC and was initially
discussed with Linus Walleij here:
https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
but as this has no dependencies to BD71828 work (which probably takes a
while) I decided to make it independent series.

Patches are compile-tested only. I have no HW to really test them. Thus I'd
appreciate carefull review. This work is mainly about converting zeros
and ones to the new defines but it wouldn't be first time I get it wrong
in one of the patches :)

Patch 1:
 - adds the defines
Patches 2 - 61:
 - convert drivers to use new defines
Patch 62:
 - Add warning print if values other than the defines is used for direction.

Patches are created on top of Linux v5.4-rc6.

--

Matti Vaittinen (62):
  gpio: Add definition for GPIO direction
  gpio: gpio-104-dio-48e: Use new GPIO_LINE_DIRECTION
  gpio: add gpio-104-idi-48: Use new GPIO_LINE_DIRECTION
  gpio: gpio-104-idio-16: Use new GPIO_LINE_DIRECTION
  gpio: gpio-74xx-mmio: Use new GPIO_LINE_DIRECTION
  gpio: gpio-amd-fch: Use new GPIO_LINE_DIRECTION
  gpio: gpio-aspeed: Use new GPIO_LINE_DIRECTION
  gpio: gpio-bcm-kona: Use new GPIO_LINE_DIRECTION
  gpio: gpio-bd70528: Use new GPIO_LINE_DIRECTION
  gpio: gpio-bd9571mwv: Use new GPIO_LINE_DIRECTION
  gpio: gpio-dln2: Use new GPIO_LINE_DIRECTION
  gpio: gpio-exar: Use new GPIO_LINE_DIRECTION
  gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-gpio-mm: Use new GPIO_LINE_DIRECTION
  gpio: gpio-htc-egpio: Use new GPIO_LINE_DIRECTION
  gpio: gpio-ich: Use new GPIO_LINE_DIRECTION
  gpio: gpio-kempld: Use new GPIO_LINE_DIRECTION
  gpio: gpio-lp873x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-lp87565: Use new GPIO_LINE_DIRECTION
  gpio: gpio-madera: Use new GPIO_LINE_DIRECTION
  gpio: gpio-max3191x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mmio: Use new GPIO_LINE_DIRECTION
  gpio: gpio-merrifield: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mockup: Use new GPIO_LINE_DIRECTION
  gpio: gpio-moxtet: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mvebu: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mxs: Use new GPIO_LINE_DIRECTION
  gpio: gpio-omap: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pca953x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pcie-idio-24: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pci-idio-16: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pisosr: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pl061: Use new GPIO_LINE_DIRECTION
  gpio: gpio-raspberrypi-exp: Use new GPIO_LINE_DIRECTION
  gpio: gpio-rcar: Use new GPIO_LINE_DIRECTION
  gpio: gpio-reg: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sama5d2-piobu: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sch311x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sch: Use new GPIO_LINE_DIRECTION
  gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
  gpio: gpio-stmpe: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tc3589x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tegra186: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tegra: Use new GPIO_LINE_DIRECTION
  gpio: gpio-thunderx: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tpic2810: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tps65086: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tps65912: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tps68470: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tqmx86: Use new GPIO_LINE_DIRECTION
  gpio: gpio-ts4900: Use new GPIO_LINE_DIRECTION
  gpio: gpio-twl4030: Use new GPIO_LINE_DIRECTION
  gpio: gpio-twl6040: Use new GPIO_LINE_DIRECTION
  gpio: gpio-uniphier: Use new GPIO_LINE_DIRECTION
  gpio: gpio-wcove: Use new GPIO_LINE_DIRECTION
  gpio: gpio-ws16c48: Use new GPIO_LINE_DIRECTION
  gpio: gpio-xgene: Use new GPIO_LINE_DIRECTION
  gpio: gpio-xra1403: Use new GPIO_LINE_DIRECTION
  gpio: gpio-xtensa: Use new GPIO_LINE_DIRECTION
  gpio: gpio-zynq: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sa1100: Use new GPIO_LINE_DIRECTION
  gpiolib: Nag for INPUT direction values other than
    GPIO_LINE_DIRECTION_IN

 drivers/gpio/gpio-104-dio-48e.c     |  5 ++++-
 drivers/gpio/gpio-104-idi-48.c      |  2 +-
 drivers/gpio/gpio-104-idio-16.c     |  4 ++--
 drivers/gpio/gpio-74xx-mmio.c       |  5 ++++-
 drivers/gpio/gpio-amd-fch.c         |  2 +-
 drivers/gpio/gpio-aspeed.c          |  7 +++----
 drivers/gpio/gpio-bcm-kona.c        |  6 +++---
 drivers/gpio/gpio-bd70528.c         |  8 +++++---
 drivers/gpio/gpio-bd9571mwv.c       |  4 +++-
 drivers/gpio/gpio-dln2.c            |  6 +++---
 drivers/gpio/gpio-exar.c            |  5 ++++-
 drivers/gpio/gpio-f7188x.c          |  5 ++++-
 drivers/gpio/gpio-gpio-mm.c         |  5 ++++-
 drivers/gpio/gpio-htc-egpio.c       |  5 ++++-
 drivers/gpio/gpio-ich.c             |  5 ++++-
 drivers/gpio/gpio-kempld.c          |  5 ++++-
 drivers/gpio/gpio-lp873x.c          |  2 +-
 drivers/gpio/gpio-lp87565.c         |  5 ++++-
 drivers/gpio/gpio-madera.c          |  5 ++++-
 drivers/gpio/gpio-max3191x.c        |  2 +-
 drivers/gpio/gpio-merrifield.c      |  5 ++++-
 drivers/gpio/gpio-mmio.c            | 21 +++++++++++++++------
 drivers/gpio/gpio-mockup.c          | 11 +++--------
 drivers/gpio/gpio-moxtet.c          |  4 ++--
 drivers/gpio/gpio-mvebu.c           |  5 ++++-
 drivers/gpio/gpio-mxs.c             |  5 ++++-
 drivers/gpio/gpio-omap.c            |  6 ++++--
 drivers/gpio/gpio-pca953x.c         |  5 ++++-
 drivers/gpio/gpio-pci-idio-16.c     |  4 ++--
 drivers/gpio/gpio-pcie-idio-24.c    |  9 ++++++---
 drivers/gpio/gpio-pisosr.c          |  2 +-
 drivers/gpio/gpio-pl061.c           |  5 ++++-
 drivers/gpio/gpio-raspberrypi-exp.c |  5 ++++-
 drivers/gpio/gpio-rcar.c            |  5 ++++-
 drivers/gpio/gpio-reg.c             |  3 ++-
 drivers/gpio/gpio-sa1100.c          |  5 ++++-
 drivers/gpio/gpio-sama5d2-piobu.c   |  7 ++++---
 drivers/gpio/gpio-sch.c             |  5 ++++-
 drivers/gpio/gpio-sch311x.c         |  5 ++++-
 drivers/gpio/gpio-siox.c            |  4 ++--
 drivers/gpio/gpio-stmpe.c           |  5 ++++-
 drivers/gpio/gpio-tc3589x.c         |  5 ++++-
 drivers/gpio/gpio-tegra.c           |  5 ++++-
 drivers/gpio/gpio-tegra186.c        |  4 ++--
 drivers/gpio/gpio-thunderx.c        |  5 ++++-
 drivers/gpio/gpio-tpic2810.c        |  2 +-
 drivers/gpio/gpio-tps65086.c        |  2 +-
 drivers/gpio/gpio-tps65912.c        |  4 ++--
 drivers/gpio/gpio-tps68470.c        |  6 +++---
 drivers/gpio/gpio-tqmx86.c          |  5 ++++-
 drivers/gpio/gpio-ts4900.c          |  5 ++++-
 drivers/gpio/gpio-twl4030.c         | 10 +++++-----
 drivers/gpio/gpio-twl6040.c         |  3 +--
 drivers/gpio/gpio-uniphier.c        |  5 ++++-
 drivers/gpio/gpio-wcove.c           |  7 +++++--
 drivers/gpio/gpio-ws16c48.c         |  5 ++++-
 drivers/gpio/gpio-xgene.c           |  5 ++++-
 drivers/gpio/gpio-xra1403.c         |  5 ++++-
 drivers/gpio/gpio-xtensa.c          |  4 ++--
 drivers/gpio/gpio-zynq.c            |  7 +++++--
 drivers/gpio/gpiolib.c              | 16 ++++++++++++++--
 include/linux/gpio/driver.h         |  3 +++
 62 files changed, 228 insertions(+), 104 deletions(-)

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
