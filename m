Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97117600651
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 07:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrQZD3WSfz3bjk
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 16:30:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aFndi2mI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aFndi2mI;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrQZ35w1lz2y28
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Oct 2022 16:30:33 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so9953436pjl.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 16 Oct 2022 22:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JRRV+BVnZSRzFh23m9ZCERUTYJbzBZ4kBt9Yb5nHkGQ=;
        b=aFndi2mIhdZkE4m6cZPPdm89z0CtfyCl/DJKoR1uBHdpOWdqUcEgD1ETr10JW4oy0D
         ksZJfpKquRnT6YQOjS8GOf3iTKNAlcbbw5jrBTbADNBfNCeYdRDKfkEbNxxk8gLLxikz
         8FMLUKjz8NOXk06NSTCutG8CGH1VRQmkopOZcBhMG2tnCIwv8GRpKcs7E224pVlBsynC
         MjTI4fPHg5DHxjCdvAmNP2Q45bonGJh245nYeWCZMjOBSU9UMuWey4DmiG3Ko2t9aJzu
         ocBjWJtcm7+E92qAsdd9umVR7S/Z7D5QfQuwiH+rA5BF5ZHPwXssP9tJAIzxDfu6wq7z
         CEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRRV+BVnZSRzFh23m9ZCERUTYJbzBZ4kBt9Yb5nHkGQ=;
        b=kfUi6nbLDHXHgWgnHTPrgddCD1PVOXkjwyfLrRnHWUblV3luHTnIO1fhgTOZtmIozU
         tLY+ypS7EaXYbcCm5Hz9pw42hth8t+mbpo569NjNW8/iVggkOUQ/98g89enQL9AIsf35
         4ZXp4asgdSFvbetQKueCt1wOx38OuFcoxIOtR6fj/mZpIbjvdAhAMH9N5nTKh0cloOvz
         fR3uWgAjzjbhL+rgrqdSFy2oqNb55fsukkDH94cgofODJ5Ekn6ne1uK1GRCRMFyT6ccJ
         flbCG46iec6KZYQrP+HkwqpRoeUx4at2uxko/fjP89ohqcBBsoTDa1F03xlBus5iu82t
         qLQA==
X-Gm-Message-State: ACrzQf1UTND+HoTHH/IZTT9UkCuXnCPL+9opzztQzyF2hzMfjcJhAWn4
	h8LUk671lrAG8h7Evv+HF+Y=
X-Google-Smtp-Source: AMsMyM764BZ4BA2I/rZP40tJ8l9JHd2XlyxM0DKTGuRYfO55wwsPgHeq46VJXIRv79rJra2KZPSNmw==
X-Received: by 2002:a17:90b:4b88:b0:20d:2935:7053 with SMTP id lr8-20020a17090b4b8800b0020d29357053mr11660718pjb.153.1665984630198;
        Sun, 16 Oct 2022 22:30:30 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902680f00b001728d7c831asm5596122plk.142.2022.10.16.22.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 22:30:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Felipe Balbi <balbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] usb: gadget: aspeed: Fix probe regression
Date: Mon, 17 Oct 2022 16:00:06 +1030
Message-Id: <20221017053006.358520-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since commit fc274c1e9973 ("USB: gadget: Add a new bus for gadgets"),
the gadget devices are proper driver core devices, which caused each
device to request pinmux settings:

 aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in USB2 mode
 aspeed-g5-pinctrl 1e6e2080.pinctrl: pin A7 already requested by 1e6a0000.usb-vhub; cannot claim for gadget.0
 aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-232 (gadget.0) status -22
 aspeed-g5-pinctrl 1e6e2080.pinctrl: could not request pin 232 (A7) from group USB2AD  on device aspeed-g5-pinctrl
 g_mass_storage gadget.0: Error applying setting, reverse things back

The vhub driver has already claimed the pins, so prevent the gadgets
from requesting them too by setting the magic of_node_reused flag. This
causes the driver core to skip the mux request.

Reported-by: Zev Weiss <zev@bewilderbeest.net>
Reported-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
Cc: stable@vger.kernel.org
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index b0dfca43fbdc..4f3bc27c1c62 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -591,6 +591,7 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 		d->gadget.max_speed = USB_SPEED_HIGH;
 	d->gadget.speed = USB_SPEED_UNKNOWN;
 	d->gadget.dev.of_node = vhub->pdev->dev.of_node;
+	d->gadget.dev.of_node_reused = true;
 
 	rc = usb_add_gadget_udc(d->port_dev, &d->gadget);
 	if (rc != 0)
-- 
2.35.1

