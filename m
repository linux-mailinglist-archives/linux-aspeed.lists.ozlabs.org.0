Return-Path: <linux-aspeed+bounces-3526-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9rZ5LDGTl2mL1AIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3526-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Feb 2026 23:48:17 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E621635D9
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Feb 2026 23:48:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH7nl3H9rz2yrl;
	Fri, 20 Feb 2026 09:48:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771515908;
	cv=none; b=YpFUkePDgf8atbe+S6OtZkUdgNiQYgBA9dkSxqEbU2oDjM8MawFGw/ZR34MPp23dttcYoOWtieWHjgbowizdfweJYe4OpiBLEJUhLjN8K6hQcsBR93C9Uj31g0d7X65XYzWRMs0ksIUEsD6W1AGfx3yQnPEO+uan5jFeaP4IfLqcnNkneddXC7KlmwvCb5uq7jgKCLZTBf8zwbu0R/IvqoDROXb78vhEN4Ah/OccsknW4xiwdKklezsg90ToCdg6bO9X2m18QKPIE5MqcHrX+edB2QciJ0/24jzg7/t+lh7k8AFQQlqYrRF9rupnrXd9JWI48s0Ri+XxitR7KHONWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771515908; c=relaxed/relaxed;
	bh=eE8E+grBmi8D3c9kMH3BrseGSOYzb2/Hbi9Rf2w2QQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TCvd6cw3E+M/bHaiMvPHUSs1J/qqUOcRmnRLFK7Wblq8n/89lfcqxxMsOXYXf0eJKhYnMyIdEKkT2RS1arVY61b0VlDp14zGGHW/ZW8U0TQZOUukwGiTJypPl6MMyzVOFLiXP9zvqF3ZBSn2JPpL2iC4cH2ZWqQqIx+wQKHdYW0csH4ePhrHyZB/YRsVuG4GswXa0LJYR/c454CGTpXM/hOHMJv+NwoWx7A9p4XlCAtnQALThBaMAVij3iSab3lLsePZI7PA0auuyz3JxJenikNPN73iysAXmv+8T0G9jv+nSrEBGdx9x4f2fuNtk1N1+oUHlCSKwqacp2OKDGLY7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cXebsbrT; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+dirkchen.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cXebsbrT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+dirkchen.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGyPb1tFPz2xlj
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Feb 2026 02:45:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D3A760054;
	Thu, 19 Feb 2026 15:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF78CC4CEF7;
	Thu, 19 Feb 2026 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771515903;
	bh=MEZIWk5e9iRnjMniEvcze5MIU7mUhoymJgLFKvBIwxQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cXebsbrTQgF5mniykYiyeGQVEbO8JzzkkCbu1/vbhC8UUO29DXHEehHJiNU/ZbJbn
	 s84RQKoi34A/mhaxJADHAKA3tX3mZEOQxg27ZLkhazft25zKZyGWTPBPZ+18+4bQFr
	 nLDnA4BS79JeAc3s2ziLgUZ6KXZoqdYWhk/nsL4LiVyyCzXq7/Fv6P6w0j20po/S9A
	 A1+9yNB9zn0DxysDgEZFfSioJ11IQ4Vh7uLgRSLleilxlqFs0xA7HmIUePzDkjdaeH
	 0RNxZyNnCuKNDHWw9rmxlpNj658vpdlqfNvgIbR6OOnmzzbxU/SRGQ35pqDWcoKF4y
	 tSKnk2BjIeO1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBFBE9A03B;
	Thu, 19 Feb 2026 15:45:03 +0000 (UTC)
From: Dirk Chen via B4 Relay <devnull+dirkchen.amd.com@kernel.org>
Date: Thu, 19 Feb 2026 23:44:47 +0800
Subject: [PATCH v3] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
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
Message-Id: <20260219-b4-anacapa-dts-fix-v3-1-4f70fd2d1070@amd.com>
X-B4-Tracking: v=1; b=H4sIAO4vl2kC/33NOQ7CMBAF0KtEU2NkOyZbxT0QxXgjLrLIjixQl
 LszSQMFohnpf+m/WSG5GFyCrlghuhxSmEYK5akA0+P4cCxYyiC5rDgdphXDEQ3OyOySmA9PJnn
 tvWux1NwADefoqD7Q251yH9IyxdfxI4u9/ctlwQSZVmkuhGou6oqDPZtpgB3L8htofwKSAO+Uq
 rDmZaP9B9i27Q2awI6R8wAAAA==
X-Change-ID: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dirk Chen <dirkchen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771515902; l=1779;
 i=dirkchen@amd.com; s=20260202; h=from:subject:message-id;
 bh=e6uon8fDwRBTubN8ywUAkYjtYXx6mIWRj19Qi3Y6T6g=;
 b=yPhRCyA6wRLeJlcr0K5q0+OqpgObOJe/AzDQSJiYDKvOW5cRhT9MUc8VQfNRlWLPZMUt0q/EO
 hdK+ttB1juxBEjXrPe59DC/BQLuAYSuWc+elt78/2d3j+BRmO5H9K/+
X-Developer-Key: i=dirkchen@amd.com; a=ed25519;
 pk=NBIyLsVg/YYtGLruq9XLdLWx2PP/1MH4jDDQ1V+7wes=
X-Endpoint-Received: by B4 Relay for dirkchen@amd.com/20260202 with
 auth_id=622
X-Original-From: Dirk Chen <dirkchen@amd.com>
Reply-To: dirkchen@amd.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3526-lists,linux-aspeed=lfdr.de,dirkchen.amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:dirkchen@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[dirkchen@amd.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.70:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,amd.com:replyto,0.0.0.3:email,0.0.0.50:email]
X-Rspamd-Queue-Id: C2E621635D9
X-Rspamd-Action: no action

From: Dirk Chen <dirkchen@amd.com>

The Anacapa board features Atmel 24C2048 EEPROMs on i2c0 and i2c1, which
are used to store retimer configurations. Add the corresponding device
tree nodes to support these components.

Signed-off-by: Dirk Chen <dirkchen@amd.com>
---
Changes in v3:
- Reorder I2C device nodes by ascending address (place eeprom@50
  before i2c-mux@70)
- Link to v2: https://lore.kernel.org/r/20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com

Changes in v2:
- Improved commit description to clarify that the change reflects
  actual hardware as requested by the reviewer.
- Removed mentions of other platforms to avoid confusion.
- Link to v1: https://lore.kernel.org/r/20260202-b4-anacapa-dts-fix-v1-1-20d4b0114854@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..1502773d9c30 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -300,6 +300,12 @@ &gpio1 {
 &i2c0 {
 	status = "okay";
 
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+
 	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -334,6 +340,12 @@ i2c0mux0ch3: i2c@3 {
 &i2c1 {
 	status = "okay";
 
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+
 	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c

Best regards,
-- 
Dirk Chen <dirkchen@amd.com>



