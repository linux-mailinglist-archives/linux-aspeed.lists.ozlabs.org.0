Return-Path: <linux-aspeed+bounces-3567-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN2OHTbYpGnWtwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-3567-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Mar 2026 01:22:14 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7A1D2127
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Mar 2026 01:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKPT1rBqz2yFK;
	Mon, 02 Mar 2026 11:22:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772205409;
	cv=none; b=JEstlX+akaW5zGnJegq529JvqMqeA35zHmlbjh0v9xwCsmPiwBL3Ud2iV+0xIcmiceAmGEOJgWCuJgk7Z49znCwIACknO9EHHO9CvvhEyCw4sNa5k7eBDA1nnbNOqG9CvQnZ2tg2ABrtsdMalN5ldys1nkh8tyOTCaupILVpX7Kes770JbH8+uQfCjTmMgLofVmhYRb8/Lpchfh0lqguTN3sbynq7aVBJV1+/VBtOlismh/3u0FRRtpFINmYww1H5JVlBkZDuIILAjXbRavtx0w5BJ/7enVhEcO6fmLLmr1sFcrJLVnEve08qw/hM5F4ZlYR/2Z4lTM2cM4rIMPSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772205409; c=relaxed/relaxed;
	bh=hVf/sLLyMfBbOFMouNBS3a/wY4p35CZfpPTEALfC59E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KE2tqdKMoWsm3k371+wI0kx7VtLmjbY3tG8hX/wLXO2P63R8yY2W4DYs0LbpFEa4NGONLWhyNz34Y6uI7S7k6LhTIrTG3AmweaSVYBg+55pGCdxSuV7z4Aqe0I9rUqOgJDLvYER/6BxUjT3cT+xnVjrGLqaWYwwAQB+GpNoS6t/BLL0/cXvD0oiRl4RaoEvQcWQ3j7Vwuic9MTHI/HsV48PtWy7JO6pgpMofkugIkv3lffQ0Dep/CEccbUp1eFQ8gDTvmIcf8WPsdl15AxRjH0mAauWuTkGz2RB1h27Iz9zX15aCluukJsCIVzbYEW+z5b0OhhtA0sz2hz/p7h+FdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ovejl7fM; dkim-atps=neutral; spf=pass (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=haiyuewa@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ovejl7fM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=haiyuewa@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMsPB22svz2xYw
	for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Feb 2026 02:16:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hV
	f/sLLyMfBbOFMouNBS3a/wY4p35CZfpPTEALfC59E=; b=ovejl7fMMWqfiqOUD9
	2OlhRjKmEAnmTTxFaebBWmIEvb+XCUQdhCeS7UeUrSTdFkxcO9wkpETIZFhmLcPA
	7GFLaEiep5dkYMwScwkzYXKL2MGGAQwAIkAsnUTivpbugnKWRDz3QyJ+bBxllM22
	F/P4FXo5s6mtFQPbWNmWFlccw=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD39_A2taFpCwnpPg--.7205S2;
	Fri, 27 Feb 2026 23:16:09 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: clock: ast2600: Add reset definition for video
Date: Fri, 27 Feb 2026 23:13:14 +0800
Message-ID: <20260227151602.829-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgD39_A2taFpCwnpPg--.7205S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4rWr1kur17try3uFykKrg_yoWkGwc_C3
	srZw4DJr1fZrZ5KFs0yF4DJw4rt34UAF9aqr90vrnIkrWYyrn0gFs5XrZIy3W8Gan3AF97
	AasYgw1fZFs7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRpyIUUUUUUU==
X-Originating-IP: [101.228.113.192]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzRo+qWmhtTo0-QAA3O
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[57];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-3567-lists,linux-aspeed=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haiyuewa@163.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[163.com,baylibre.com,kernel.org,aspeedtech.com,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 90F7A1D2127
X-Rspamd-Action: no action

Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
header. It is required for proper reset control of the video on the
AST2600 SoC for aspeed-video driver.

Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
v2:
  - Fix checkpatch.pl warning, and send dt-bindings as single patch as
    the submitting-patches guide.
v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index f60fff261130..7b9b80c38a8b 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -124,6 +124,7 @@
 #define ASPEED_RESET_PCIE_RC_OEN	18
 #define ASPEED_RESET_MAC2		12
 #define ASPEED_RESET_MAC1		11
+#define ASPEED_RESET_VIDEO		6
 #define ASPEED_RESET_PCI_DP		5
 #define ASPEED_RESET_HACE		4
 #define ASPEED_RESET_AHB		1
-- 
2.53.0


