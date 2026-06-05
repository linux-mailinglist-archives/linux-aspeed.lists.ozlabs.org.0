Return-Path: <linux-aspeed+bounces-4191-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0hdEBw+JI2p1vAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4191-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 06 Jun 2026 04:42:23 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0764C3D3
	for <lists+linux-aspeed@lfdr.de>; Sat, 06 Jun 2026 04:42:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=ScIhBV1w;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4191-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4191-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gXMyy31fZz2xM7;
	Sat, 06 Jun 2026 12:42:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780639188;
	cv=none; b=iyoFacqEzdUYjex1d85KQ/sTCCjV9x82GCGYzTVXDj7kGgovG0jEAsgdXwhiqOSU+UQFteKG/Io9O/2oqQATJyq3HTxEfa2yxgIceypF9W+X3Mpu3AK/ZYTLWUiD0xabNirpR6s8bth70ucrn067noJpS0VQSf9N19VjiOZiAlwBdtCArSNSm2AM7TNK14Hsu4JviLs+RtufBuTL21hQHklT06n8cTWcWo4wb+EZWq9zDUfk2mrwVnhFAdASKI5ZxCASCSIno48GMWUe1ufJXbWkY1YLlzWgYPsrDb6E7gh8IyvdbVelsdEWfLhPYV2I+zsCyKBvI37HebllkbF09w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780639188; c=relaxed/relaxed;
	bh=ZHgu+JGrqQgPjnjWztMAItH0/+Es2yqtkSf5YhCP5lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQvN1LGO9i4OjQlwSH3YidhQLF3DcBcyC3E+73LGIpdeF8CWVf2BQdsDJHXeZS6JX7LSG3Go2tO9dLzaeajk1W5+pmExU1fP/rT9zvW7SrKOWtL5rZZYht/FzGXZnFxLafpBW6HH9OuSEzlm5E1UTbNhZEaV3N8318RuC4p3ix6pX5e9Xm8/B7XKxdD9EFIB2TcpfwFbaeZ3rJ/BQBBKC6gRqdOhvPZFTwSwVsFa/x5g12ZhOTwSKa4Ed8kwns+D6NEg7WI5uygOaXP1s+EzgQuu6a36mcCjFuc97Xr+aFCT8MkPklZL2rH9Hd7RUoM3X7IHURB1MRj1wa6HHjgKIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ScIhBV1w; dkim-atps=neutral; spf=pass (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=haiyuewa@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
X-Greylist: delayed 137 seconds by postgrey-1.37 at boromir; Fri, 05 Jun 2026 15:59:45 AEST
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gWrPF1y1Sz2xHK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 05 Jun 2026 15:59:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZH
	gu+JGrqQgPjnjWztMAItH0/+Es2yqtkSf5YhCP5lY=; b=ScIhBV1wn6Wd2Y2nj5
	32IxZhtDYc9xy9z/x19InoZJT13v7EHUXSYZ7OMRSAut/F4Jc2GCpAmY8KaC3lWQ
	1H1H/3WU5FjaduQUJUI5umsvo9eNhNrH2+dQUYNofQS+uKFsZ5DblOhtuQzLo2hw
	lWQ1efhWNAIzYJDiEFDPrttAI=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXkGE7ZSJqxsLwAQ--.65168S2;
	Fri, 05 Jun 2026 13:57:16 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>
Subject: [PATCH v4 0/2] Fix aspeed-video driver load failure
Date: Fri,  5 Jun 2026 13:52:41 +0800
Message-ID: <20260605055712.118501-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
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
X-CM-TRANSID:PCgvCgAXkGE7ZSJqxsLwAQ--.65168S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1fZw4xXr4UKw1rCFykKrg_yoW3KFXE9w
	1xGwn5JrykAFWj9F1F9F4qywn8KryYkrn5Aryjqry7ua4ayr90gFZ7Gas3Xw1UWa97AFs0
	ya15WwsxZrn0gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRK-eOJUUUUU==
X-Originating-IP: [116.233.237.18]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC7xyL9moiZTyazAAA3J
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4191-lists,linux-aspeed=lfdr.de];
	FORGED_SENDER(0.00)[haiyuewa@163.com,linux-aspeed@lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:haiyuewa@163.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[haiyuewa@163.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[163.com];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31F0764C3D3

v4:
  - No code change, re-send with cover letter for more than one patch
v3: https://lore.kernel.org/all/20260302011651.94682-1-haiyuewa@163.com/ 
  - Drop 'Fixes:' tag in header file patch.
v2: https://lore.kernel.org/all/20260227151602.829-1-haiyuewa@163.com/
  - Fix checkpatch.pl warning, and send dt-bindings as single patch as
    the submitting-patches guide.
v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/

Haiyue Wang (2):
  dt-bindings: clock: ast2600: Add reset definition for video
  ARM: dts: aspeed: add 'resets' to video node

 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi   | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi   | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi   | 1 +
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 4 files changed, 4 insertions(+)

-- 
2.54.0


