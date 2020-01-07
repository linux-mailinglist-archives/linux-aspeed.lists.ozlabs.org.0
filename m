Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD2131E1C
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 04:44:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sJCX1HrJzDqLy
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 14:44:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vWBJFj7l"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sJBy6YRszDqJT
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jan 2020 14:43:54 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p9so22640879plk.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jan 2020 19:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQ9/DC53GURoy8uPVJwwkeJi6XJeKnxIDYkVR0iQwQs=;
 b=vWBJFj7l6TMl4AOJKf5X9VW3UJTLj5KRhDpkjG/XRys7liNh2J8d1FbteOvt5wznSM
 4zJxH5dUoFjg3fs1CeOhYTcg4KPdDwWSYhF4WPJkik/Ujl97facgI/O+lkxRL1xWboSC
 UAZq0PlnNYZ8d3h+imgzHDEnNREGDJAZv+3jFLZdK8O27Mh1XECf3largM3JwDxXud/z
 wnRmX9QrDVakjRYa4mhYSMcZFT/wTRu5JYgwwzJLAfCT7XEs5+M6+iHQ25Jg2LjyYM+8
 3RiZ72+CCx7+vAhZOTp0pxO9fVIjgeK/JOdzXaSB9ESg778kwqpxf4nbPbHQpQ5iCzaK
 uvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AQ9/DC53GURoy8uPVJwwkeJi6XJeKnxIDYkVR0iQwQs=;
 b=KOhKhZOyYxMK/qQL+6AM+E9CcSHrZx6ClGMJyzh1dgSfWpH38EtcdAHdLfV4AHd32R
 A6V0G1Wqb9ZB395TKGZApDw7sqBJvG2N4ZVp9JcbdsO16Z9eWMZLE9KG4qxKb1DaQZfv
 l5B2B5n0+NmqOK6peAPrap2q26WuCJWLeovJdF74Dgcw58MF6PREczmpOvOMKSBUjb+X
 9J/l2Q+/13c15bNQBmREp5ax+ff/R28wvIQJxt1rVJMchvxRisSPAgX7tvp0nn+c7ISx
 JZRSRZkpp8XEKzeNRfl2WhvG5P0Kcie0lWjfOXKvGUE+mbfh+ftPd3OSBwkP9flEk6g7
 e9YQ==
X-Gm-Message-State: APjAAAVYaenK/1zdW1mstBNZJ6PRchk5OuDo7nTRPmR+Dp4TvYvDcgw1
 YLSIGByEMVyqgDt9Ux3rYMc=
X-Google-Smtp-Source: APXvYqzyIqucHdp6zdPgZQRg5EOXhTzApjHSoYm7Ljqb+UGqUCgE+VZlsH2fwIQxYxpGipFu2Gy0qQ==
X-Received: by 2002:a17:902:988f:: with SMTP id
 s15mr101569674plp.98.1578368632288; 
 Mon, 06 Jan 2020 19:43:52 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 19:43:51 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 3/3] video: aspeed: Update copyright information
Date: Tue,  7 Jan 2020 14:13:24 +1030
Message-Id: <20200107034324.38073-4-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107034324.38073-1-joel@jms.id.au>
References: <20200107034324.38073-1-joel@jms.id.au>
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
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the preferred form for GPL2+, and add IBM and Intel as the authors.
The driver was initially upstreamed by Eddie from IBM, and has had major
contributions from Jae at Intel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/media/platform/aspeed-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d70b893fd4cf..71e0dbdb37dc 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1,4 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2020 IBM Corp.
+// Copyright (c) 2019 Intel Corporation
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
-- 
2.24.1

