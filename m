Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47398B054
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkl4N2hz3gCF
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697918;
	cv=none; b=MTlXaq5qAk0JizJdYj8GVLIq2PV788qbeDZXexBh6Lvc8kpru6dEQOODfE399XRdjO8ZCfh7GIaKOmxkZIm0KTCRqnuJH5/2yIWT3ExjY+kLRrJrpjTLAxd2/UoYvJO8E/xahV5LYLAGaAMchF/q7Ofqputt2rrPqe20sMSxbUXifpoRUPhGGFZe3qREO1IeL3jomWxNW+jZElNAWOKgeLslgskCAuWeulU1Zynflp7nxJZlJW8XoZKPwTCguDhZ6quILb58aJsx6VSM+IOClTZXYSlhhxEAcxXUrRP0YFyxyqUsF9tlAGSf7/QuVJe2ENg2QavtwkQB5dVlctCqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697918; c=relaxed/relaxed;
	bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZELh7rq5zYoh1nOLAIxKmyyoRo5VmNNwlD+L6R5EYryofN2Jr8MmJQiYALobdZ2Z7jqMkZbuzy6hIejrgjWhWIkzf6pqBRVxyhU+eoPODFNmZ0/PQPh7Dhet9H5dJIU0NRBtJceqHrHrfKDU9+rCdTqFGP2AVxTZK4Ib4/w0rsGNFgfjkhL6K2aE1Vta+4KKGhg7R49vLCQXPGn5isAYPUI2Z5oRf8gvfXKJzaP48fdlYDepo4npago4WMpl7pm2rqlTd+gQJQw/O0u5sypbCbYlKqjPMIHIRUTHlTcT4+oSwMjJ+qruJrVDJ0H911ngRM9js6jyvdv1sje1DQYEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hl6dGu0Q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hl6dGu0Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWx5XNVz2ymr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:17 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6cb2dffcdbbso37874876d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697916; x=1728302716; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
        b=hl6dGu0QGTbP7c7mbVZV6z5vPz//C9q3iZVkTatuYA1cARC/0ndtoS16LU4OtCrI5T
         Yka1J8jZSrC84FCGorUKCN45H6ZtB1pMLNDn7WIp7cRsKmxdRNu8vgiE4jPJyC1w7nSU
         DWTQuuX07nY4aH0b39D52rEfEc24X6PIH52EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697916; x=1728302716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
        b=PzbDFSr6HuWyo2ZhUqBv0Ts/FmkHiE5spscxRuDXrzB9w3fO9HyGAH/cr3/2ZEP9Hd
         IECz4KVG1hzszbCBTR88u1dQsKgl3Prta29jrXo/UlyaMV/RzOjdNu/ySawAmXrPBv1t
         leD3eg6isrP44UR+1NTEsTuV9B8Sm2qanRflBbpNJikIwnyi+8Of49IvZMNSZXcHuQm5
         rGVVLKEDJ7pvHOgfJ7EpvoBdATi49Bc9MedcRIsjHxRox+QRWT8xjS9Id6HuYZVAQGmO
         RitteFHFI3Y/Y67IBtV3he4KqEo2S+yq749k3K/ie+ETAt7HANM+OoAgFRS25UsNF1Ww
         dW6A==
X-Forwarded-Encrypted: i=1; AJvYcCWcbNQLWjTyheu0sege1FRtiz+eJFK/YRLLjOmgLWO4rRerV5yELAXOIJj0a3qBswzj9xgnunCKtuG2lVg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMCf3CViTbd+WRdhcGW8qxuAn81bi07NvdvWD1V10NTrztHShE
	kTeszqTTgLGvRRagwXJ3CqNM1hs1UoElkLOdXW0PJHN3M/URN4FWhnu5x5BJrw==
X-Google-Smtp-Source: AGHT+IFHqIZOoSZ0SNoSJp6T9EpjigAIsbvAUF0oGwPlw/LLEGHSlB7PElYqfizjzUxKI+v34TuK6Q==
X-Received: by 2002:a05:6214:3c9a:b0:6c3:55f3:ed92 with SMTP id 6a1803df08f44-6cb3b5e7233mr204180416d6.2.1727697915550;
        Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:31 +0000
Subject: [PATCH 36/45] media: i2c: st-mipid02: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-36-81e137456ce0@chromium.org>
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
drivers/media/i2c/st-mipid02.c:552:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index b947a55281f0..70a691504eed 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -549,7 +549,7 @@ static int mipid02_s_stream(struct v4l2_subdev *sd, int enable)
 		       mipid02_stream_disable(bridge);
 	if (ret)
 		dev_err(&client->dev, "failed to stream %s (%d)\n",
-			enable ? "enable" : "disable", ret);
+			str_enable_disable(enable), ret);
 
 	return ret;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

