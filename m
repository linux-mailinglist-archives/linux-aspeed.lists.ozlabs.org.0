Return-Path: <linux-aspeed+bounces-3994-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO0aFKXt82ms8wEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3994-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 01 May 2026 02:02:45 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2044A915A
	for <lists+linux-aspeed@lfdr.de>; Fri, 01 May 2026 02:02:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g6B7Q1Lhbz2xll;
	Fri, 01 May 2026 10:02:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777527951;
	cv=none; b=BWHqD2qXrHNp4rscZ9KiBQcVSx622vkOwWqxUHk6o3E3kc+ShdbX8q683h5CWOR9+OjejQhrtb/3OL4BTAUdPlLutLCv+7TSLGutxLmTiKnAFSu0LvoHygWyOXWof/pOI+Fv3k6sKzWyX6gAKzPC4zFuUQbZdjsYmxW3J7+187RAxdG0WYjiA2qnYy/FzgVJJKtJjBlzxTXOnJ2ltZMZBfaoLtP9BGERxuSJEmZ+YMjRF6sy9SpKkeeFve3yM2SfLulm6AGAmCwXmgfNcmFCVMkYgvUzfROgwQXE7JZg1c1PbAh6dIyq1P/19iZqkDP9cDigC0pL4eHCtTlJzLeHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777527951; c=relaxed/relaxed;
	bh=v46Ws/xOIgw8gSDlJIUPyTMQ4uJtu1hJ8VMz+R6vOkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WZjHj11fkn+Fxl+gVo83mOVIiqm9yz5HDCv0jVjzI6vzmiaXeLzf7oacAg5P6/HbxxpHUGu+Xij7x3AgOPDqD1G8I6ANfyn/JnHtAbc3vLRfc6LKsabNy06gYHjqOIoh8iSxn6/dhOmjcD8leId9kRcsjaaDMTzZTS8AH1iWej3P8rojy2F/OfoEvV1BEpsPEMWbSAwYVx0sg4hlSsuzSIVmVe8ul7u5c0+oTjcc76lg0kbEgem5pT0S4qi7wtrf+Lv6p2vzTEuVpqGhUZ7+wda2gXlIc8uTrZPrsciR/WDo8vNJwAIYOSJMzHCaiHha3K63VJ4LjTrIDhZcaEY/BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r3ViC7bH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+rex.fu.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r3ViC7bH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+rex.fu.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g5jnp5YFGz2xMY
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Apr 2026 15:45:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AB20405DF;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59C40C2BCB8;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777527948;
	bh=/tkgJeqOmmrJzR3XxdwYwLro87tsKaNd19RouarTTO8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=r3ViC7bHBo9vMLgWRlcm7dJWyLccD4DRD5a+PsvyS4nO3o0FiaJZix6dZ/FOPw8ho
	 tUxT3Hxfv0YgQa8Jt19t5Tn2eBX4DbYCkon7RXKwbE6j1+pX0Udf6eh2UHBWJJZ8wt
	 b5Z/IztnygykkV3Usd6898AC8PzhXYaUZCR24RRDiwcE3+afSlNq+xeTbqgjdJlMJG
	 iiTuYOTLLF1S1cv74OvpDdn2SqsodGr8oqPADn/fgb35wbFx1Ya/MKSmWBx31FgNE4
	 LSdEWZH9FHyysPBKdhwONZByHWLFO2zfvN3BxM1mKDDNQsuDf5XKzeNcQTGzVgXNRJ
	 Qw9GS0ZJb54uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47279CD1297;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
From: Rex Fu via B4 Relay <devnull+Rex.Fu.amd.com@kernel.org>
Date: Thu, 30 Apr 2026 13:44:28 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: name EDSFF and thermtrip SGPIO
 lines
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com>
X-B4-Tracking: v=1; b=H4sIADvs8mkC/yXMwQrCMAwA0F8ZORvoqgzxV8RD2qVbBLuSVBHG/
 n2dHt/lrWCswga3bgXlj5gsuaE/dRBnyhOjjM3gnR/c5eyQMkUqhDYVWZBHSwnrzPqqKgUpBu+
 vIQ19YGhHUU7y/f33x9/2Dk+O9Uhh23ZG96kXgQAAAA==
X-Change-ID: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Rex Fu <Rex.Fu@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777527924; l=1868;
 i=Rex.Fu@amd.com; s=20260417; h=from:subject:message-id;
 bh=FKvzsI9xHFmGcGo9UHVCAjhAhv7ytsitasP4Y5ub01A=;
 b=GPiFDR+/ibGE0NwGTxGFGmQdcKyr+YrgZyfg43LrcwIi2ZH7TGSoZmO77kXGMks/g4aHs7xEr
 73Dk+5T4CraD5T71ecP2h9D4jP6C68jM1Nj8r/ozRB7Hvh1j+k7MeL/
X-Developer-Key: i=Rex.Fu@amd.com; a=ed25519;
 pk=26ECoh24fxrbXDKgA4hCmgg0xjQ+IxU97kXb46ovwgc=
X-Endpoint-Received: by B4 Relay for Rex.Fu@amd.com/20260417 with
 auth_id=738
X-Original-From: Rex Fu <Rex.Fu@amd.com>
Reply-To: Rex.Fu@amd.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 6D2044A915A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3994-lists,linux-aspeed=lfdr.de,Rex.Fu.amd.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:Rex.Fu@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[Rex.Fu@amd.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,amd.com:replyto,amd.com:mid]

From: Rex Fu <Rex.Fu@amd.com>

Name the Anacapa SGPIO lines used for EDSFF power-good and thermtrip
assertion signals.

The affected lines replace legacy or unused CPU-related names with the
platform signal names used by userspace monitoring.

Signed-off-by: Rex Fu <Rex.Fu@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..fe960bb7bc27 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -912,7 +912,7 @@ &sgpiom0 {
 	"PWRGD_PVDDIO_P0", "",
 	"PWRGD_PVDDIO_MEM_S3_P0", "",
 	"PWRGD_CHMP_CPU0_FPGA", "",
-	"PWRGD_CHIL_CPU0_FPGA", "",
+	"HPM_EDSFF_PG", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
 	"", "",
@@ -957,8 +957,8 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
-	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
+	"L_EDSFF2_PG", "", "L_EDSFF3_PG", "",
+	"R_EDSFF2_PG", "", "R_EDSFF3_PG", "",
 	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
 	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
 
@@ -984,8 +984,8 @@ &sgpiom0 {
 	"HPM_PWR_FAIL", "Port80_b0",
 	"FM_DIMM_IP_FAIL", "Port80_b1",
 	"FM_DIMM_AH_FAIL", "Port80_b2",
-	"HPM_AMC_THERMTRIP_R_L", "Port80_b3",
-	"FM_CPU0_THERMTRIP_N", "Port80_b4",
+	"AMC_THERMTRIP_ASSERT", "Port80_b3",
+	"CPU_THERMTRIP_ASSERT", "Port80_b4",
 	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
 	"CPLD_SGPIO_RDY", "Port80_b6",
 	"", "Port80_b7",

---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be

Best regards,
--  
Rex Fu <Rex.Fu@amd.com>



