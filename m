Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9398B04D
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkj1gw4z3g69
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697906;
	cv=none; b=jVWa5HdNprJ9/bxf9brHhYTuyG5PYAXIcEV6FgWlX80XVFXQtA7OWKfm6I0+xc5ntnw5Y77lBU8wjP40tt2VjWI+FAmLY2korL2F+R02owSuAvY5QcHxdoXnXLa8qMZmWr8gR+3Mtb6MOsOnmSL1GF4KJMQY6syq6cyPUtZo7o/YkgBM1y6KFWfLCiRs0Nor2TnoUHdo3tqYoKiSapnS5eYKIXPBQQh6LJ9EkMVVV950AFmfPHlfIPozjUU5C3YcyqQVCAnglZ0JY0KyTdg8j5ENpExrgq+TLISusQve9LBQqpWrJAYzI8/kFRIuRRc1xrCk5S0IgZTzb3P/FRwlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697906; c=relaxed/relaxed;
	bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYVF0xdcUuiBilqrl1nbGNagOmB0HbdklISPtCK+p/H+sfyfRjTU4aiwDQIaSARY9VDjYnai0ayTzY2DdSMJSfzX94ZlH+LYhfI3F7i6qgFv0jhLD6fs/XLlYqN1Wah0u0GFleYBP1Vz+qfamnlC9MvYauaU+BIuqEvyg59xEOTOgyf+BMk+D4xh4ExuSgsfyqtD03Ev0bPCZnJH2THNGq6m1IHnoUAtLihcty8+Fj9Ps8E+T+JbK5bJTGFKnvgkXOKcAhk/IxYNW9yWUMrdKpwnQYUqv0ClvR4Xa8ZsN9+V/RQJFTyHMxOFjNdJN3ck/o29LGSl3UERSLJ/umN+4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SHnrYL0t; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SHnrYL0t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWk3dHyz2ydR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:06 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a9af813f6cso405639385a.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697903; x=1728302703; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
        b=SHnrYL0tsYzcp6L9LDo/WqrNJFMJ5poEb1AMYWKpwuzECw4mD9FFZHRTg7fQPYUp04
         aoQOIjW2n1TSvejZ5xKBrydZ64uCSyvaNl14F7nBTon0x/JzB78X/6RSURc/KZszguhl
         O/SJH+uJVN4slgbiCHHPHQE+fN7MAEazKZBoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697903; x=1728302703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
        b=BGKw5TSu0S/+cgV3/Z7bJezlmH5fJ+gh15y39DjoFOMNbMxStMBajLwUogIgteNFn8
         JYzNmpCHhfXqsaEzSyEFjJ6jKhCaEFSlWdEX0A+j/5ZfBO1ycOm4aTcO3VhjGMLnCrS+
         //2M9/vkOq7xQoCmOH1surltsHbe/7Fw/0GCywxg+FDN6/01hQRdR3vb32ZvRbz8Ew77
         C1cmAFeReJTqivBEbMoFXG1ynS4EpURL7k8P+pgCrmA6bqpoKeGeTmoyBxMoA1EGIfSY
         b2OZc94ejsTIZkOxxiVm0Qfxe3IWUpcYvhA2bJXBYkhx9EfGvSD/rclIaxQsQVeKed7s
         XnPg==
X-Forwarded-Encrypted: i=1; AJvYcCXdiUOA2nivg6v5VWV7Tldc3k8PkpLED7rY+BkjhszAJ7uMYWZGoxPCQuhWX7bvvrjdTOSOPf70c4LWhMs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvQyZmlRAc6Rz9+r+I8x1PBm4BnjA09j8PNDIl2bNPS1H0uN8i
	b3aaVvSYzGnGL5XmZGQ5q4gBI7FB4l/s+dSCBJtXF719IyIeK5SQRkOu7l5oXw==
X-Google-Smtp-Source: AGHT+IEAFwwRA71MkCRUwImfi9uBIeNCYwuxiEwHafmSSDdtTJviDnVg18iocWAWeF5m9aVEXLwnZA==
X-Received: by 2002:a05:6214:5a08:b0:6c5:b709:55c6 with SMTP id 6a1803df08f44-6cb3b63b3aamr219594876d6.42.1727697902571;
        Mon, 30 Sep 2024 05:05:02 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:24 +0000
Subject: [PATCH 29/45] media: siano: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-29-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The following cocci warning is fixed:
drivers/media/common/siano/sms-cards.c:329:36-41: opportunity for str_enabled_disabled(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/sms-cards.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/sms-cards.c b/drivers/media/common/siano/sms-cards.c
index d4a116ab6c88..e9aa95233ff1 100644
--- a/drivers/media/common/siano/sms-cards.c
+++ b/drivers/media/common/siano/sms-cards.c
@@ -8,6 +8,7 @@
 #include "sms-cards.h"
 #include "smsir.h"
 #include <linux/module.h>
+#include <linux/string_choices.h>
 
 static struct sms_board sms_boards[] = {
 	[SMS_BOARD_UNKNOWN] = {
@@ -326,7 +327,7 @@ int sms_board_lna_control(struct smscore_device_t *coredev, int onoff)
 	int board_id = smscore_get_board_id(coredev);
 	struct sms_board *board = sms_get_board(board_id);
 
-	pr_debug("%s: LNA %s\n", __func__, onoff ? "enabled" : "disabled");
+	pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
 
 	switch (board_id) {
 	case SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2:

-- 
2.46.1.824.gd892dcdcdd-goog

