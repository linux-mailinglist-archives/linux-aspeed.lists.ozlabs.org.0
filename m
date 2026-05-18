Return-Path: <linux-aspeed+bounces-4077-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLdOFCWmC2ozKgUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4077-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 01:52:05 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01457533B
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 01:52:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2L6s2cz3bqV;
	Tue, 19 May 2026 09:51:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779098992;
	cv=none; b=kVYrshkC1VNPZ7k2kRd6g6OvKy46JzAC2sklHEEfRBR2ucmZRbeTG1QK/ffiI+0Q5iOlxLU9zZkCxD3EX5MOvYK43UoRTWgWagAky74iiUOmSmony3CVRFnVZm7c9aiqVHOloVgVQA9IiFjFfnx2JpKY3SUSf+o8ejQCfWr2Oi073gBA1gTqprwrSib924lRRXZYQK7bEzL3BQgu5TZsDNCzkIxiUCrEDgtIhVW2OKZkksaDAI1A7YkY4hKZItdpU9u2RXWoto+pO+roJ1D6v4WZYBG+iOy9CSoXCIUwvfK1bJ93OMVfblorSbjHAIO0/3MjMww0SVLQj/w1iBB3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779098992; c=relaxed/relaxed;
	bh=6YOePkzpKdtcaeSkD2ei9bKN6cTmuB9GBSIuGfGIbww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kCKGWH/50tzrARsXwbXGI6bCu1fiKsXIXhtS60TklRBcGbTTRG+f5R9OTrj9oztycF0rdLKnCwI4unFmclz2d6ucE/txYGJf99vlvk8qu1Ti3z2jdHOPdJHVrrenQEIjFmAX/QZg072++j+7nf7uSp+/ozx2yBBeT9p/ZgyfjSCcCN6FMDa3W/fAodYQ17uzWT9HPh6w+UkjboD8FMaEeI0RYGNzBsH2Nb6N1cts6gzPFqDR6ZIFhlBAeR5GI5zXh93MBmLoa2ftqkOvivY7B+CHbqDbxmR/vZTr5DhJEO8zro0mehhYOcnPGi+KN3QbBTvejHMKMlLLeC/l+OP84w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nAy4SXup; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+rex.fu.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nAy4SXup;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+rex.fu.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJtp73p8hz2yDs
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 20:09:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC00F43E18;
	Mon, 18 May 2026 10:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7E31C2BCC6;
	Mon, 18 May 2026 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098989;
	bh=u56jg7DlcON9+DXGEF4UUjo0mA99ELeWFFq/Ike9RM8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nAy4SXupexX5Yd/Jh65iRzTGGKibrwsVMx4Do553FwQOWDk8pNtcdeQiEYw/M1y1R
	 2SOnNZtpy+5SgAR/UTPBE4m8hjVxGSdEUbt8WvJSeb8B1yYuFNRDAlglFqHBHRvNvW
	 LJhMVt2nhI0SjNrBzmKBkv6E755upD6Yg+qxgyzaAuDuWiAD3NQL9/iqv1/z5yDSCg
	 C4UPn298sXtznWOIpRevUfjk7j7bJ1BmpnEdD5QP4JwDMCfqnHEvF4jy4pM0WuR4EY
	 vIQF/SIgRVbgrx2BqHCyHOeS9ws85RQFblwxJOdRTp5yJ2n1iRZo1rT/CCT0j7jJZL
	 CeVlWEg1KkpwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965C3CD4F54;
	Mon, 18 May 2026 10:09:49 +0000 (UTC)
From: Rex Fu via B4 Relay <devnull+Rex.Fu.amd.com@kernel.org>
Date: Mon, 18 May 2026 18:00:40 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: correct SGPIO names for
 monitoring
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
Message-Id: <20260518-anacapa-sgpio-edsff-thermtrip-v2-1-e43b1847b2dc@amd.com>
X-B4-Tracking: v=1; b=H4sIAEfjCmoC/42OSwrCMBRFt1Iy9kmSfhRH7kM6yOelfUKbkMSgl
 O7dtm7A4YHDuXdhCSNhYrdqYRELJfLzBvJUMTOqeUAguzGTXHa8qTmoWRkVFKQhkAe0yTnII8Y
 pRwqgjJbyql0nNLKtESI6eh/9R//j9NJPNHmP7sZIKfv4OQ4UsXv/bhUBAqSzLV5kU7eW39Vkz
 8ZPrF/X9QvqpmBx2gAAAA==
X-Change-ID: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Rex Fu <Rex.Fu@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779098465; l=4551;
 i=Rex.Fu@amd.com; s=20260417; h=from:subject:message-id;
 bh=R6pEDyauTB50Fmhvxn0QsYGtV2og2/4FKpGrDbJds/8=;
 b=RC64u2ytJ72iyOUFotIilIIvQnQwyvi5OfqMn3hKP+rzzxF8q2th+T0U1TtU6hXd+NbgacbZ0
 kRDPXrW5GeECk58Ywm1UgI3Pjx7idCfONhNhX9W2thRQSbad/63mm9J
X-Developer-Key: i=Rex.Fu@amd.com; a=ed25519;
 pk=26ECoh24fxrbXDKgA4hCmgg0xjQ+IxU97kXb46ovwgc=
X-Endpoint-Received: by B4 Relay for Rex.Fu@amd.com/20260417 with
 auth_id=738
X-Original-From: Rex Fu <Rex.Fu@amd.com>
Reply-To: Rex.Fu@amd.com
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4077-lists,linux-aspeed=lfdr.de,Rex.Fu.amd.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:Rex.Fu@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[Rex.Fu@amd.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,infradead.org:email,amd.com:replyto,amd.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 7D01457533B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rex Fu <Rex.Fu@amd.com>

Update several Anacapa SGPIO line names to match the existing platform
hardware design and the signal names consumed by userspace monitoring.

The previous names did not match the actual Anacapa SGPIO usage. Some
lines were named as CPU or CPU power-good signals, but they are wired and
used on Anacapa for EDSFF presence, EDSFF power-good, boot EDSFF
presence, and thermal-trip assertion monitoring.

Correct the mappings as follows:

  PWRGD_PVDDCR_SOC_P0     -> L_PRSNT_EDSFF0_N
  PWRGD_PVDDIO_P0         -> L_PRSNT_EDSFF1_N
  PWRGD_PVDDIO_MEM_S3_P0  -> R_PRSNT_EDSFF2_N
  PWRGD_CHMP_CPU0_FPGA    -> R_PRSNT_EDSFF3_N
  PWRGD_CHIL_CPU0_FPGA    -> HPM_EDSFF_PG
  EAM2_CPU_MOD_PWR_GD_R   -> PRSNT_EDSFF_BOOT_N
  CPU0_SP7R1              -> L_EDSFF0_PG
  CPU0_SP7R2              -> L_EDSFF1_PG
  CPU0_SP7R3              -> R_EDSFF2_PG
  CPU0_SP7R4              -> R_EDSFF3_PG
  HPM_AMC_THERMTRIP_R_L   -> AMC_THERMTRIP_ASSERT
  FM_CPU0_THERMTRIP_N     -> CPU_THERMTRIP_ASSERT

The left-side EDSFF slots are numbered as EDSFF0 and EDSFF1 to match
the platform slot numbering used by userspace. The thermtrip names are
also updated to describe the asserted condition monitored by userspace
instead of the raw active-low signal names.

This is a naming correction for the existing Anacapa hardware design.
There is no new board revision or underlying hardware change involved.

Signed-off-by: Rex Fu <Rex.Fu@amd.com>
---
Update the Anacapa SGPIO line names to match the existing hardware
design and the platform signal names used by userspace monitoring.

The v2 commit message now explains why changing these userspace-visible
GPIO line names is appropriate and lists the exact old-to-new mappings.
---
Changes in v2:
- Reworked the commit message to explain why these userspace-visible
  GPIO line names are changed.
- Listed the exact old-to-new SGPIO line name mappings.
- Clarified that this is a naming correction for the existing hardware
  design and not a board revision or hardware change.
- Link to v1: https://patch.msgid.link/20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts  | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..e898bc11e6f5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -908,11 +908,11 @@ &sgpiom0 {
 	"", "", "", "",
 
 	/* G0-G7 line 96-111 */
-	"PWRGD_PVDDCR_SOC_P0", "",
-	"PWRGD_PVDDIO_P0", "",
-	"PWRGD_PVDDIO_MEM_S3_P0", "",
-	"PWRGD_CHMP_CPU0_FPGA", "",
-	"PWRGD_CHIL_CPU0_FPGA", "",
+	"L_PRSNT_EDSFF0_N", "",
+	"L_PRSNT_EDSFF1_N", "",
+	"R_PRSNT_EDSFF2_N", "",
+	"R_PRSNT_EDSFF3_N", "",
+	"HPM_EDSFF_PG", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
 	"", "",
@@ -934,7 +934,7 @@ &sgpiom0 {
 	"EAM3_BRD_PRSNT_R_L", "",
 	"EAM0_CPU_MOD_PWR_GD_R", "",
 	"EAM1_CPU_MOD_PWR_GD_R", "",
-	"EAM2_CPU_MOD_PWR_GD_R", "",
+	"PRSNT_EDSFF_BOOT_N", "",
 	"EAM3_CPU_MOD_PWR_GD_R", "",
 
 	/* J0-J7 line 144-159 */
@@ -957,8 +957,8 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
-	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
+	"L_EDSFF0_PG", "", "L_EDSFF1_PG", "",
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



