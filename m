Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE453CA19
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 14:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF2WZ06Rtz3bnd
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 22:39:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y007TVDT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y007TVDT;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF2WV1wFsz2xBF
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Jun 2022 22:39:17 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso7132824pjg.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Jun 2022 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZeh6dPlumSxGZHW+VabBQeUNOylTh9kH627gkvPD+A=;
        b=Y007TVDTsVw2lMEBXkR/FDRNRV6iyelZ51Ogy3OHkyUxu5lyWsKT5NvAJWTmGx+5ku
         7SPyy8Q9FvgqXHsRr3cqUCSu8P0sEmUphieQGMnAL4rwzKq1/T4o8SShk7nGIIuVIJ7s
         sAJk9SBu059Jsf3aZBF3WgzYewGjI/izch7jta9PIaaDYRVT6UjFIg59Z+5UdKL1n4Z3
         o1RAhsDEs+moKuck8+3NPVgX1ag1oBcCxuxJU62Q+r8JbVAjV/qtCkNu2gSTr33n+QDj
         5y8ZvVS/3Msue9oUKSevHa0iFV31Zdkhk/sAaYrGGFtJL/RWndHjEkXEn0sSba712JPq
         t08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZeh6dPlumSxGZHW+VabBQeUNOylTh9kH627gkvPD+A=;
        b=2DtSryjpuSaZgAa3/dG4st0wIDLxgRPcFS5+Qwqh88NhLbTL7vgGQQ3Hhsh/d/+V6K
         aTOx9ht0zBTEhEVt8cvNl30d42inbRln9t4UYQJjCOlr3g7c1SClaQJy/LCKH0nnoPkg
         cX0fqtu7TfVS8dVcypRuvVtRwbAwvciIDZP/ZRfEihYwwTVdLhxohRjPz/qhY0zwdUmv
         Bqjib9PJz1XMd6IPf2wTh6g5cI4HWaW1maOl82Vy/05Y11rxsMovYKh3wnXVy9tdARCL
         ZVuni9uu5mBI/pfa4UGPK3kxgLebdNZ3vjEczecIK8ItRoIh/REq2W3Ei6eOaSotae4I
         1IqA==
X-Gm-Message-State: AOAM533gp9pnhPB0z9hUhwFYw2Ici/SaApgELCTb93t2xIFpYvByVBv/
	j7ik+vkq+NmNQCH2dXYIbfw=
X-Google-Smtp-Source: ABdhPJxTwFTdmtpYkEYSdKalAhQdMMJ2P6PK6DiB3tuvARtFEmIIk6ddSDvYnFSLZ94zcHu1HAEyVQ==
X-Received: by 2002:a17:902:d592:b0:161:3bf4:9047 with SMTP id k18-20020a170902d59200b001613bf49047mr3355736plh.137.1654259954469;
        Fri, 03 Jun 2022 05:39:14 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id ju10-20020a17090b20ca00b001df264610c4sm5483212pjb.0.2022.06.03.05.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:39:13 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Patrick Venture <venture@google.com>,
	Robert Lippert <roblip@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
Date: Fri,  3 Jun 2022 16:39:02 +0400
Message-Id: <20220603123904.30714-1-linmq006@gmail.com>
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

platform_get_irq() returns negative error number instead 0 on failure.
And the doc of platform_get_irq() provides a usage example:

    int irq = platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

Fix the check of return value to catch errors correctly.

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
v1 Link: https://lore.kernel.org/r/20220114064357.18562-1-linmq006@gmail.com
In previous v1 thread:
Reviewed-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Signed-off-by: Patrick Venture <venture@google.com>

v2 Link: https://lore.kernel.org/r/20220603082336.3867-1-linmq006@gmail.com
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index eceeaf8dfbeb..c4a03b3a5cf8 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -167,8 +167,8 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	int rc;
 
 	lpc_snoop->irq = platform_get_irq(pdev, 0);
-	if (!lpc_snoop->irq)
-		return -ENODEV;
+	if (lpc_snoop->irq < 0)
+		return lpc_snoop->irq;
 
 	rc = devm_request_irq(dev, lpc_snoop->irq,
 			      aspeed_lpc_snoop_irq, IRQF_SHARED,
-- 
2.25.1

