Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE3527EDF
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 May 2022 09:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1s0p243bz3bxh
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 May 2022 17:52:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nGIjLzNo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nGIjLzNo; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1s0g3kWzz2ypD
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 May 2022 17:52:18 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d22so13668672plr.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 May 2022 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHwMpClyQynjA2cM8OcoohBNhLjDi14SgAXOvOdZEbo=;
 b=nGIjLzNobp+vqVe56g2rvlpS7/7o46TAxZoO0J80VdDyZ0eI8m534CnQp0WOqzc4yl
 141mrcvH/BsjZoB0P0n5vSQU9+C7ZxD3kOZlObtSFqfXAd7HcXMioy/WoVP2eQIwTOuE
 X2N5wDDCqpQJWnKOCB40o88MBMmnshdzaX4dhV8DD22pj7Dx4ToH2q8ARFG2kHlif4/U
 0H2/mE+n5ncdNPXE4y1+c8N2NnrFZgrM7zEUP+hJ//vB3wl5eniAmItPwmwYwFOwdX3r
 wlfrqHSNk0/J/m3CIoH9R+GdS82N2ELf7Zg0NEEwKEK2zHj2ZW1N/Xuoa+2G+MQD+B0t
 iXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHwMpClyQynjA2cM8OcoohBNhLjDi14SgAXOvOdZEbo=;
 b=bk5rESUp9BmONnYUfOoQoVWS5H/0Y7fAFjBjdZ2+r7CKecK1NHakBTmVEIHZ3k2WU4
 C6iGcp9UC5tvHIvm3Pm8aSCpMYX4PNlL4Y271V5cdRNnuNlWpnCywdZxH9ldGKSCKg/n
 RCT55T1tnj5JKnJ/hvgf6NhNldFTRvDyuVRQcePPXheJ6EqX6MUhegdeH+I5oVaU2rGy
 clav9t0eNTMlH8lpDF9uBujXRckRR1YZ4clHnxTvOMuNAA2ulpm06jn8FgZRKk217F4H
 KClm/wQoJYs8vvBk6ZLVWJuDTZtbJ7N2AFDkNYGtWz8PAUwi4W1mtRtwFrlV043ly6S7
 I/fw==
X-Gm-Message-State: AOAM533U38JyYYXnwkh+DQHgq77Q19g1PSZT2k1DxC34QDyJdSvDYazf
 LUY8fhKoIEfALl4wZ1jLvtc=
X-Google-Smtp-Source: ABdhPJz276ABAIAuW896KA5vz0XXu814EgBO3IQUcxDqw00HuNKFl6XPbstTD15t/E9qCoX4qIZKFw==
X-Received: by 2002:a17:90b:1e03:b0:1dc:5a7d:bba8 with SMTP id
 pg3-20020a17090b1e0300b001dc5a7dbba8mr17849338pjb.156.1652687535848; 
 Mon, 16 May 2022 00:52:15 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 hv19-20020a17090ae41300b001cd630f301fsm7809297pjb.36.2022.05.16.00.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 00:52:15 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Miaoqian Lin <linmq006@gmail.com>,
 Colin Ian King <colin.king@intel.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: aspeed: Fix refcount leak in
 aspeed_adc_set_trim_data
Date: Mon, 16 May 2022 11:52:02 +0400
Message-Id: <20220516075206.34580-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

of_find_node_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: d0a4c17b4073 ("iio: adc: aspeed: Get and set trimming data.")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/iio/adc/aspeed_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 0793d2474cdc..9341e0e0eb55 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -186,6 +186,7 @@ static int aspeed_adc_set_trim_data(struct iio_dev *indio_dev)
 		return -EOPNOTSUPP;
 	}
 	scu = syscon_node_to_regmap(syscon);
+	of_node_put(syscon);
 	if (IS_ERR(scu)) {
 		dev_warn(data->dev, "Failed to get syscon regmap\n");
 		return -EOPNOTSUPP;
-- 
2.25.1

