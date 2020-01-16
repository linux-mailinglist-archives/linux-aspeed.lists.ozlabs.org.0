Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A2913F1A2
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jan 2020 19:31:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zCSS3VPRzDqfq
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 05:31:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=zvOCsLo0; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9mH4s0jzDqcK
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jan 2020 04:14:39 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFB28246A0;
 Thu, 16 Jan 2020 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194878;
 bh=P4JS33lPfd5CksSa+DV0l9XssAnGxxCSrEewU7X7u24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zvOCsLo0W1tG7EA5E9DeS4bKV1Xh3i2RwDQjV4HEOfaE3zuGOw6J/D/tcB/9v/H9B
 MtsQ9eENvmTR0hDySd6+3vODzO/nTkQYjEYGcf7S9uzQYvXBqwSJEIKpZoX8bIIPes
 bcmn77XRd/kfwEVztUin1Qy9OXTWOf2naH6YpkwY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 667/671] soc: aspeed: Fix snoop_file_poll()'s
 return type
Date: Thu, 16 Jan 2020 12:05:05 -0500
Message-Id: <20200116170509.12787-404-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

[ Upstream commit a4e55ccd4392e70f296d12e81b93c6ca96ee21d5 ]

snoop_file_poll() is defined as returning 'unsigned int' but the
.poll method is declared as returning '__poll_t', a bitwise type.

Fix this by using the proper return type and using the EPOLL
constants instead of the POLL ones, as required for __poll_t.

Link: https://lore.kernel.org/r/20191121051851.268726-1-joel@jms.id.au
Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/misc/aspeed-lpc-snoop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-snoop.c b/drivers/misc/aspeed-lpc-snoop.c
index 2feb4347d67f..c10be21a1663 100644
--- a/drivers/misc/aspeed-lpc-snoop.c
+++ b/drivers/misc/aspeed-lpc-snoop.c
@@ -101,13 +101,13 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 	return ret ? ret : copied;
 }
 
-static unsigned int snoop_file_poll(struct file *file,
+static __poll_t snoop_file_poll(struct file *file,
 				    struct poll_table_struct *pt)
 {
 	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
 
 	poll_wait(file, &chan->wq, pt);
-	return !kfifo_is_empty(&chan->fifo) ? POLLIN : 0;
+	return !kfifo_is_empty(&chan->fifo) ? EPOLLIN : 0;
 }
 
 static const struct file_operations snoop_fops = {
-- 
2.20.1

