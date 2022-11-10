Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F7E6238E7
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Nov 2022 02:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N74C40cTKz3cck
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Nov 2022 12:34:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=j3YgJkCe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=j3YgJkCe;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N74Bx5wGcz2yxc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Nov 2022 12:34:49 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9F1F1216;
	Wed,  9 Nov 2022 17:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668044084;
	bh=aMUJmwn2tQh5G1GOQ7muR4JdKNLACHu6x6zglyc6xeo=;
	h=From:To:Cc:Subject:Date:From;
	b=j3YgJkCeaZFMY3ySEztwGyArlwSjTmP2O3YQ9XznmrjQgLKe0ziaFVEd78TzMGzSn
	 XNHCgYpHGfmliBnFeIcVUvVReWxXBRGbafKgF6UMAss+moAda/muO3OqjWf/n26UX1
	 bt/RAjF6hkR0XbIH2ZmKMjN42G4e3ccJwyrsFJs8=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] MAINTAINERS: aspeed: Update git tree URL
Date: Wed,  9 Nov 2022 17:34:38 -0800
Message-Id: <20221110013438.16212-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
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
Cc: Zev Weiss <zev@bewilderbeest.net>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The description for joel/aspeed.git on git.kernel.org currently says:

    Old Aspeed tree. Please see joel/bmc.git

Let's update MAINTAINERS accordingly.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cac5a4ad4eb8..1775e5fdaefd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1969,7 +1969,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
 F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed-*
 F:	arch/arm/mach-aspeed/
-- 
2.38.1

