Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC762DB48F
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Dec 2020 20:39:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwT8d6RD5zDqL2
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Dec 2020 06:38:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 903 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Dec 2020 06:38:50 AEDT
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwT8V0dRTzDqCV;
 Wed, 16 Dec 2020 06:38:49 +1100 (AEDT)
X-AuditID: ac1060b2-a93ff700000017ec-cf-5fd90d3ec55e
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 7F.95.06124.E3D09DF5; Tue, 15 Dec 2020 14:23:42 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Tue, 15 Dec 2020 14:23:41 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed, ncsi-rx,
 v1 1/1] net: ftgmac100: Fix AST2600 EVB NCSI RX issue
Date: Tue, 15 Dec 2020 14:23:23 -0500
Message-ID: <20201215192323.24359-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215192323.24359-1-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMLMWRmVeSWpSXmKPExsWyRiBhgq4d7814g/Z/uha7LnNYzDnfwmLx
 +/xfZosL2/pYLZpXn2O2uLxrDpvFqZYXLA7sHlfbd7F7bFl5k8nj4sdjzB6bVnWyeZyfsZDR
 4/MmuQC2KC6blNSczLLUIn27BK6Mjlvf2Qo+sFZsPdTA2MD4m6WLkZNDQsBEYvvxw2xdjFwc
 QgK7mCR+rrzMCuUwSrR/vswOUsUmoCaxd/McJpCEiMBqRomeDb8YQRLMAukSky5cZQKxhQX8
 JZ4fvswMYrMIqEr0r7wG1swrYCox48kDdoh18hKrNxwAquHg4BQwk9hzSg4kLARU0rrvHRNE
 uaDEyZlPWCDGS0gcfPGCGaJGVuLWocdMEGMUJR78+s46gVFgFpKWWUhaFjAyrWIUSizJyU3M
 zEkvN9RLzM3US87P3cQICehNOxhbLpofYmTiYDzEKMHBrCTC++ftjXgh3pTEyqrUovz4otKc
 1OJDjNIcLErivKvcj8YLCaQnlqRmp6YWpBbBZJk4OKUaGDf/PMYTU8jDyq0R13k4SeTU4cqf
 +b6XTftiFpp4KrnHWe19q5KUst2iosT9cePrzHBR1/KVu44Ubgpf3MO0P6t+mbBYsn/1WpnP
 D4pO3SwsWJHKMF9U6dwizs7e/cxLt/NM3qWlt3fbwzP/XKQyK1cYdjRVWnq/EJeSEdtzJdjK
 Kr4hM/KdEktxRqKhFnNRcSIA50nffVYCAAA=
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
Cc: Hongwei Zhang <hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix AST2600 EVB NCSI RX timeout issue by removing FTGMAC100_RXDES0_RX_ERR bit
from macro RXDES0_ANY_ERROR.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/net/ethernet/faraday/ftgmac100.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index 63b3e02fab16..734477e6f72f 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -252,7 +252,6 @@ struct ftgmac100_rxdes {
 
 /* Errors we care about for dropping packets */
 #define RXDES0_ANY_ERROR		( \
-	FTGMAC100_RXDES0_RX_ERR		| \
 	FTGMAC100_RXDES0_CRC_ERR	| \
 	FTGMAC100_RXDES0_FTL		| \
 	FTGMAC100_RXDES0_RUNT		| \
-- 
2.17.1

