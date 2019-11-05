Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B56CEF2B28
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:47:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z8t1233zF6F9
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:47:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.193;
 helo=mail-lj1-f193.google.com; envelope-from=mazziesaccount@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476lph1XlBzF4f9
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Nov 2019 21:12:43 +1100 (AEDT)
Received: by mail-lj1-f193.google.com with SMTP id e9so7817366ljp.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Nov 2019 02:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V7qLFq4K93vUH8fK9wNC+b3dmkN6TfhoYmCQsWeu7yY=;
 b=FpvN0z5SKOPBwP9+myBBtZafhnJZbkVw94+CmFB952J4VPVZ5jqzipoHLSQZ+HQu3M
 IzNE7+5KtBzM63QeDre3Xuf0aW920TZ66JwyS+RAS39k+zrD8HvSGj5k/H0m+9yGo07a
 u6taXydBu6K6cu0MKd380K6cF9zIriK80ZW/5QhCCyqcsCxRpRf47K6NMFIz51WKj13X
 JCJyp2o7XgsotTM1i6OzJlccFx+aOnHMcUqwIU6ikfuiKqG7tS278tFHiRvp26ZRv2mf
 M5RBpliRde/HR/hqiWyxamDJJZbiREgQJIuVLITDCbh394PvwE1w+zlsDq6EfOdJq+XH
 rCyQ==
X-Gm-Message-State: APjAAAV0XbtF88na8aosWRt+PYxXCpamzyGVaygQJK4cfHD7TtPxvIBv
 dwlUy3eJCnX+XwMhUU7HjOQ=
X-Google-Smtp-Source: APXvYqwjjYsGhWJv9rnRxQZ46vKzy4j+wiUPekzGtjMuNsXdHE3646nl8SjkCccQfYCbSzyJz8M77w==
X-Received: by 2002:a2e:28a:: with SMTP id y10mr20290638lje.155.1572948760228; 
 Tue, 05 Nov 2019 02:12:40 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id k9sm1362903lfj.97.2019.11.05.02.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:12:39 -0800 (PST)
Date: Tue, 5 Nov 2019 12:12:30 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [PATCH 07/62] gpio: gpio-aspeed: Use new GPIO_LINE_DIRECTION
Message-ID: <493e2f9ed5aff112519adcdf2d3044bf54c2d91a.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-aspeed.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 09e53c5f3b0a..f1037b61f763 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -487,10 +487,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	u32 val;
 
 	if (!have_input(gpio, offset))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	if (!have_output(gpio, offset))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
@@ -498,8 +498,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
-	return !val;
-
+	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
 static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
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
