Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FCC3225A3
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 07:02:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl7k85s93z3cGp
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 17:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=HKY8ALzU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=jk@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=HKY8ALzU; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl7k53ndlz30Pl;
 Tue, 23 Feb 2021 17:02:21 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl7k40cVFz9sSC;
 Tue, 23 Feb 2021 17:02:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1614060140; bh=AlPaEEhaxhxwBnh9wanwNwYFYy7ejHXtzHk62RaXVwc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HKY8ALzUuTvkqIETqvGTnur03+L/wVgt0tQGIP+j7aoxCRce+ELNgOJx3CIfLIDxI
 098NuIq6CkrPmvLEqmRrgXLRBudO2KHY4AR+G30kVNDQKvGmBEs7kpJM08ppMggMNS
 AvYfQnXjdbuMlczIjfrPo0wpWtP4A5bXMXuCllcYfnG9LKFkkHncGXqJ+pxrYZArO1
 IvLocPbqdHdhYzZ64oprOm21jRh+pWaYlevt1W0WYSCY8BlG8ydWszaXXVCVFZhIzx
 hrxmxhMh12+EGhWbZDDsutgvvXAxnZkf3SapJtMDZIIcc8Sx+TTfTVPjxZfhOG3heW
 8axHsl/FH0BlQ==
Message-ID: <b8578a7cb7c0db81442e7a13e62ad0fb818b7297.camel@ozlabs.org>
Subject: Re: [PATCH] fsi: aspeed: Emit fewer barriers in opb operations
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>, 
 Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 23 Feb 2021 14:02:13 +0800
In-Reply-To: <20210223041737.171274-1-joel@jms.id.au>
References: <20210223041737.171274-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hey Joel,

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 90dbe58ca1ed..09fff86b2bac 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -101,11 +101,11 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
        u32 reg, status;
        int ret;
 
-       writel(CMD_WRITE, base + OPB0_RW);
-       writel(transfer_size, base + OPB0_XFER_SIZE);
-       writel(addr, base + OPB0_FSI_ADDR);
-       writel(val, base + OPB0_FSI_DATA_W);
-       writel(0x1, base + OPB_IRQ_CLEAR);
+       writel_relaxed(CMD_WRITE, base + OPB0_RW);
+       writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
+       writel_relaxed(addr, base + OPB0_FSI_ADDR);
+       writel_relaxed(val, base + OPB0_FSI_DATA_W);
+       writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
        writel(0x1, base + OPB_TRIGGER);

Future-joel is going to be angry at you if you don't add a comment
about the ordering requirements there.

Otherwise,

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

