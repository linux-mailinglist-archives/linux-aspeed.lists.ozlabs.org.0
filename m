Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55604646670
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Dec 2022 02:24:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSGfP4PKGz3bgv
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Dec 2022 12:24:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSGfK1vczz3bT0
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Dec 2022 12:24:38 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2B81FC9Q039171;
	Thu, 8 Dec 2022 09:15:12 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Dec
 2022 09:23:38 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: docs: aspeed-video: Update reference
Date: Thu, 8 Dec 2022 09:24:23 +0800
Message-ID: <20221208012423.3106-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2B81FC9Q039171
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

Use URL rather than plain text.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 Documentation/userspace-api/media/drivers/aspeed-video.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/aspeed-video.rst b/Documentation/userspace-api/media/drivers/aspeed-video.rst
index e5656a8d990e..0e9a3cc838d6 100644
--- a/Documentation/userspace-api/media/drivers/aspeed-video.rst
+++ b/Documentation/userspace-api/media/drivers/aspeed-video.rst
@@ -23,7 +23,7 @@ proprietary mode.
 
 More details on the ASPEED video hardware operations can be found in
 *chapter 6.2.16 KVM Video Driver* of SDK_User_Guide which available on
-AspeedTech-BMC/openbmc/releases.
+`github <https://github.com/AspeedTech-BMC/openbmc/releases/>`__.
 
 The ASPEED video driver implements the following driver-specific control:
 

base-commit: 8ed710da2873c2aeb3bb805864a699affaf1d03b
prerequisite-patch-id: bf47e8ab2998acfbc32be5a4b7b5ae8a3ae4218b
prerequisite-patch-id: bf82715983e08f2e810ff1a82ce644f5f9006cd9
prerequisite-patch-id: 28a2040ef0235e5765f05d2fc5529bce2a0f4c6f
prerequisite-patch-id: 7e761c779730536db8baf50db5fc8caf058e95af
prerequisite-patch-id: c48ea20973fa35938a7d33a0e20d2900df48755f
prerequisite-patch-id: 5d2c8043e4026469638dc4541aec76deefa39315
-- 
2.25.1

