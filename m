Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BFE10D020
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 01:09:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PFH54WQFzDr9T
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 11:09:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UYCvHEtN"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PFGm1bkdzDr8g
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 Nov 2019 11:08:48 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id v93so9223039pjb.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Nov 2019 16:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
 b=UYCvHEtNIYBwa0Za1WBa3dxE1m+gfbQgwgTFwnEcA/XvoOoDQPKR/8UFMlICqzcOj+
 MaiJhlhqUMrtgsOx5uExZR1tttyaSvFblAYt184ik6ZOTv4D7ElSLQA9fuyY3h73bDkQ
 rMBh34ddwhMNb2b8R0DM71jQ6lHEE+jbtdygRCjjOzVJnGfjD2WeKUX2rtYvUw8uPPmY
 Za5R0DWjR/+FkKIdWP7KK6X3qhAklCtjT+lWGbE3QYN8lzaCInn9UnrqIqPGAcm0Ch5O
 G3p6h2MSgc/qUXFBfn2fsWAQxiVm+pKA4ozodjlnePLhyyTz6EAWuaoSobGxCqNcKLs1
 JxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
 b=I36gvHhW+yoi/5KnCNPIZXB8RCbKYslR0Z4sSeRzPYvdY69UseD1uvupZMsqY80PIq
 Usm1B5JCJq/aUvW64MJHA3iPWoNVi3CGvG3TpuVLm5IJoOfLI5jqoVjxXjne9hr0O5iZ
 8ghH2Ie3epRZMKekFMSqYTo0L5raXG3MTvzCIsJ5aMYaJmhdiSR0RoU0xsPmDdFpA1kx
 3S61LsVW3fARww7gP0Rvpc0LZsJUA+tssriQzlqhPVdCN0y/gnW+gf4dA57+rZ9b8O9a
 ReDcDUBdHMcPJoJXylrPxQ9I7x2EDNk6IGl13kIvCziqUQCC/6mXLVece/zfOfk4S9kV
 1SFw==
X-Gm-Message-State: APjAAAVUiE556Z1mx/cH+VgyP0dvjVlMZQDrxz2xenlx7RI3c3a1V6nM
 qmTVqb/lQZwjItlD4qrF/ms=
X-Google-Smtp-Source: APXvYqxmjyy3ULMbqx2R9Xe9O17n8M/xUNkdlkz/MQq0OYoeEpeaKw2qXPIva5xZ4guojBbM3mviHQ==
X-Received: by 2002:a17:902:ac8b:: with SMTP id
 h11mr5022220plr.87.1574986125721; 
 Thu, 28 Nov 2019 16:08:45 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d188sm21302075pfa.157.2019.11.28.16.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 16:08:45 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
Date: Fri, 29 Nov 2019 10:38:27 +1030
Message-Id: <20191129000827.650566-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129000827.650566-1-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The AST2600 SoC contains the same LPC register set as the AST2500.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/reset/reset-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 067e7e7b34f1..795c9063fe7b 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "aspeed,ast2400-lpc-reset" },
 	{ .compatible = "aspeed,ast2500-lpc-reset" },
+	{ .compatible = "aspeed,ast2600-lpc-reset" },
 	{ .compatible = "bitmain,bm1880-reset",
 		.data = &reset_simple_active_low },
 	{ .compatible = "snps,dw-high-reset" },
-- 
2.24.0

