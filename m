Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D7D1048CF
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 04:06:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JPbV2kWSzDqCw
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 14:06:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BG1oNkKO"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hjg61LSrzDqQD
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Nov 2019 11:07:10 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id n1so25990445wra.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Nov 2019 16:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7u0vuDrO1PbhdaGTzNJSFWi+UDVK44G/M8ptTaBTUJY=;
 b=BG1oNkKOsdGxpHa+T5K+FowoOxps2wPnyI4wb7xyvV2j9bB71Nk6I6g0fcSfn4uS2U
 WKqlYyTJOUF3jGHQq0en/UuqiiSdcknpOURglq/HmQHThjPPY0I81XYN1SgRa+K350k9
 K7ceBV5CTkyJU3hV1y9SMYaYU6Z5jJ8WDVuOUgpYIwR1do2nu/aOCYGWUA20+ak61qHg
 kdwDQ1VFHVoy2xW+Hnc+gQLGfdLYzhzh1Y+mL4UCzRWnX0v91OHpUCMvoGr0XT4yEoQB
 YdpHHs6fHZhvH/kA9wSUM4Nwe3YAQilB3FPo2UWGbZtuEKhcu8ar6dG9ua7l0eiLjMXp
 7yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7u0vuDrO1PbhdaGTzNJSFWi+UDVK44G/M8ptTaBTUJY=;
 b=mJRBdcMrpFQRT2kY55ajn3n/Q7u/F7wfK9mBzXwTNw1ftdZL16M2PZQpfsjYbg0vJn
 vxaSWYQyUcv5hEI45zE8aSaD9isHROFxLBRpSzKSbrUGRcbOE3OqW2q3vEQGr+Tr3gwc
 sXVjYG0gctys62EldVIVt1iVU4v29+udEmyESQqRzPDCrl3Xxdm0hDC5hK+RQRtmTrva
 7znkRwiV6w5/izMR9rDWpGuQIV2zyjnRNKcKvIE4j1eUnZfMonAGOGejPwxMdhlQUUjI
 8R4VAfT7jE3FvTxF1F2qtPnkvXdi/XBa3A2g+pCIJ5QqGOZ0Bd65kNDnY+IfUIy9e+/c
 tKkw==
X-Gm-Message-State: APjAAAXMmkZzldA7j+f97TLXQKVhRrLSmZxvw2zjum2cWd1mOKhkdQnL
 LFi2SKuDMkv1EqwZp/BhxJo=
X-Google-Smtp-Source: APXvYqynXZV5DmNKwcF41YMQI+zkMN2y+tT+EDVTDe/ER3FhFgZXekgKmDf/npYjX2nka84iVuLfLw==
X-Received: by 2002:a5d:574d:: with SMTP id q13mr94016wrw.263.1574208426257;
 Tue, 19 Nov 2019 16:07:06 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
 by smtp.gmail.com with ESMTPSA id c11sm15073776wrv.92.2019.11.19.16.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 16:07:05 -0800 (PST)
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] aspeed: fix snoop_file_poll()'s return type
Date: Wed, 20 Nov 2019 01:06:47 +0100
Message-Id: <20191120000647.30551-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Nov 2019 14:06:18 +1100
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
Cc: linux-aspeed@lists.ozlabs.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

snoop_file_poll() is defined as returning 'unsigned int' but the
.poll method is declared as returning '__poll_t', a bitwise type.

Fix this by using the proper return type and using the EPOLL
constants instead of the POLL ones, as required for __poll_t.

CC: Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>
CC: linux-aspeed@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 48f7ac238861..f3d8d53ab84d 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -97,13 +97,13 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
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
2.24.0

