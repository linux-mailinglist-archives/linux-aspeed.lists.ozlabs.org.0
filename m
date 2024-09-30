Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CBF98B04A
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkh136nz2xCd
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697900;
	cv=none; b=Wu4t9DD0rUxyLjo5qsRb1Zjojpfq0rJ3LXm1SabZ99p+b8lzyyGHA2C+/rGNT/lD/8ZnW4EYJPTjk2aYLBWHdjPAune3vPO1AxXef8ExNddCrOmwBVQ5KZe9tv6G2JGoG4iJC3OOiyI3+ZCia+RluJCTnjQfIkxZxhCdKq5cevEkJNCutD+qfQiTX8zq/hKNlYJq18IslFhdbFHeFWGp4jLtgY4uM1wKTacg5LPH+3z+2YheB8+Bmw0AHQ7SfeaN+cA4PLNwZqBINi8V9jP18H/e3zOF2GVPp/2koYnoMtiKSnvlm3SDMyoccfBTMmmrAvKHTw+Yyi+BW/l5LfaraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697900; c=relaxed/relaxed;
	bh=tIonQ/DAaQ73YEKHhPQbmT6IJ8ZJpmHYGgDzVtOZCdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gi9jL5VS4mJABCt4SwVqNDq6Rz/Fh+qXdornUDr/kyxkh6pau/dGPj54xwjbqv2tQzkhqc3b9fm2qGO5PK6VvTX/77zE74FPWYvJBalJFhFmjZ2CUTPs6F+o52d5a4MbyZRFwxlgEzYSbwRN0dWzOKMye2CraDUTGgj7fWxjQC7qcKSbNNpLzmwMzTlbsKrVP126bNtsWTfGN1RbeKI5zBIQQY2Lrx6PZzJAU/75XVLQ3k+x3DBKfigpYRdsiWj59/6dbTTp/jMVU+3LVDOqFPEQvA8ugTcnlzs+DR+zRxo76XK5aNBKQrTNeEa3Jyq3h9hPJ2q48Q0Vv79ArS4tew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RlKYjRO0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RlKYjRO0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWc1cSwz2ygG
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:00 +1000 (AEST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5e57b7cac4fso2523625eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697897; x=1728302697; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIonQ/DAaQ73YEKHhPQbmT6IJ8ZJpmHYGgDzVtOZCdY=;
        b=RlKYjRO03ZyIxF4p7S/H5n+L70sWP6zu9GbINyjx9Tom7HDZhBeMwk60Vgk4l6hVqz
         sfMYtycxwXbEQLsoBng1oV/yCvdLYgb5lpZHlhc+DHAIhw629s8pnjS9eLQ3nFgvBuwn
         wL5ObpMRteixdM/TFZ6jw3RhHaOSE/ybV8hiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697897; x=1728302697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIonQ/DAaQ73YEKHhPQbmT6IJ8ZJpmHYGgDzVtOZCdY=;
        b=j3pXjgzRUfVTgmxA0FeAJSjitvZ9fWHa+NkYifJMX/q/eJPVJRT6WFDlgl/9+r4yRX
         m6YSyumKvv1M8JN1orx2F3GJ/gPkKlJ3Y6UUFGsVDrldDlSEFGt3VpYmrshIolDrVsQ+
         gKVzxQ/C28KofARF9etKzvW6fasqGuP2y/zrxbdVUQyB7cK+1S4T71e9Rr0PHIFTHIKe
         kzzVMYkFtV3T9TCLryuKR3XGfto0/F5kTyASLMsSeftZE+/vYDBKSnxK90RsRM+1or+f
         tcQ0POPEt6BUDs+H6iYeYemO0HPCpEObjXdkxUOPCd3ghi5aOUF+AiK8CxqjQ3Wpnwd8
         ehqA==
X-Forwarded-Encrypted: i=1; AJvYcCXDrVJlSWFHP6CGkzFSQ8M3or+LKuMXbR9Wxjs+SQia77KCv0w0D5+TpPRgeP+/zKeupBXIIjSsYBbmqc4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6QeujZ3mjCkz451B/9to7xeittO5MHZGVBg7q4IOewur1RdUL
	f0Wydcmrw6ioq6slKFlvLZToaQRuPbw4JWyuBwmxcEHU8HnuccLK8O63d0Belw==
X-Google-Smtp-Source: AGHT+IGBBDkCLdkyPSXSamdMv+lg/+wwDPA6EahlQnUNGQaV2riLXTLngR4tQbOORFsEO3I87GPG9Q==
X-Received: by 2002:a05:6358:54a6:b0:1b8:33fc:ae71 with SMTP id e5c5f4694b2df-1becbc9be95mr344688455d.16.1727697897424;
        Mon, 30 Sep 2024 05:04:57 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:21 +0000
Subject: [PATCH 26/45] media: videobuf2: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-26-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/media/common/videobuf2/videobuf2-core.c:3008:2-6: opportunity for str_read_write(read)
drivers/media/common/videobuf2/videobuf2-core.c:2860:2-8: opportunity for str_read_write(( read ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29a8d876e6c2..05678fa14fe9 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2857,7 +2857,8 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		return -EBUSY;
 
 	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
-		(read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
+		str_read_write(read), q->min_reqbufs_allocation,
+		q->fileio_read_once,
 		q->fileio_write_immediately);
 
 	fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
@@ -3005,7 +3006,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	int ret;
 
 	dprintk(q, 3, "mode %s, offset %ld, count %zd, %sblocking\n",
-		read ? "read" : "write", (long)*ppos, count,
+		str_read_write(read), (long)*ppos, count,
 		nonblock ? "non" : "");
 
 	if (!data)

-- 
2.46.1.824.gd892dcdcdd-goog

