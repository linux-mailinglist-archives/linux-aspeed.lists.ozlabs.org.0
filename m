Return-Path: <linux-aspeed+bounces-4172-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kwBUITuHH2p1mwAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4172-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 03 Jun 2026 03:45:31 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B626633828
	for <lists+linux-aspeed@lfdr.de>; Wed, 03 Jun 2026 03:45:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=Pzsp8wid;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4172-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4172-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVVrm4Mljz2xg3;
	Wed, 03 Jun 2026 11:45:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780451128;
	cv=none; b=YFVB2kgucIYP5HDCnLAQr5JaH3JuqVkKiY7msrocQAh1PYnNIL8WvJTNptOpxyjDQias/3bFTZCM0w9FzRrIfOe91ZAjvrBW2dKFsi3ekbh9vXrjuCrjZy/TPokYbSUfXXhS/lHxDBGmCIb0KYLyumTqnNeC4JbN2I1suAFfsPJOz7o6PlWkthy6J8ZY3Nlpn7UMXNgcn/8B5VJBglC7wauDf3flBqKaSZiUVN3VfshAComXXmw/MaL05YDdUjM/HmFvyKKHX2baas9+4OPfiMsxHPrd2y7LkahM0cayYuflY44cAefPpWeoAsRwaxZTFSH+PbGImF+Zgn4ilb5eKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780451128; c=relaxed/relaxed;
	bh=6sNKaf6Emxid3ZVnRf3FrHFQvVHAGDbo00Rv0+jMbEM=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=GOAE4Eu6mv9LQ37/lLb0vBEgMY3fhUgO18feIXc6KCx0S06Qg3eOQc02kJ1vrPhUchMEK2M1C5vVgtUeCnOJ9ptG8a8u9Pz4RCepaqQ4H7cRjkwL7DW1hWCw5K9Tyj4M4M0K/ICnyC4+vUYUw+NjIBdlbEdA5p2tHjv+hyXVgrsTEtUbAS78EJuG7mbpEBVsZiqRr5hySIEeeMYnRiRo3cuX6Gu22Do+diGCWcpXJpJaGefqwUCJfKgL1SmHsZTvBWDpRbQJE5ex0Y1IY6lJvkfkmYWyJnTAX5vdWdP7vDgkH3t2RQ+grCrXbJ9+k7AklS3x51srIfGmVT7zEpF9EA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Pzsp8wid; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVVrl5z6Sz2xc2
	for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jun 2026 11:45:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780451126;
	bh=6sNKaf6Emxid3ZVnRf3FrHFQvVHAGDbo00Rv0+jMbEM=;
	h=Subject:From:To:Cc:Date;
	b=Pzsp8widNNQW7lqYjOla9SV0FDAI+RLJyW+mVvMJR4Uqg8RR3xCb5tR/ehxAWXxhW
	 6CPj7Sz8sHE83Jc8qynufLBIG4JAk44kcJtAg68SDJnPV/B2IwL7s5ZcCv2y5r1ocU
	 LdjthGl3VI7blsWS8gJiC48QHG6NQAb7GXJ0dSANxhXjAxzvIAOaaddUU8ti2tTYSH
	 q0IUd3HvVe5fjzz4deqhllDjKgLVnJMtFVShHDe2QG+z5FKjy13tSh399hxRONzUqO
	 AL1ev+iZvi3fIZtXaKR/02pKI+ImwZiqd92b5zcRF3SpF4u6qtXryJFN6MqsDd5MiM
	 lEJkg7RMGrRcw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1B9F66025D;
	Wed,  3 Jun 2026 09:45:25 +0800 (AWST)
Message-ID: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 11:15:25 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4172-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B626633828

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-drivers-0

for you to fetch changes up to bc13f14f5cd3d15054de38dc1232b49343d36297:

  soc: aspeed: cleanup dead default for ASPEED_SOCINFO (2026-06-03 10:47:55=
 +0930)

----------------------------------------------------------------
aspeed: First batch of driver changes for v7.2

While bc13f14f5cd3 ("soc: aspeed: cleanup dead default for
ASPEED_SOCINFO") was committed just now it has been in -next for a while as
b333a0f1c857411d83a02aa6f1d9ecc7666d6179. The commit is fresh as I moved it
between branches.

Other than that it's just the one other patch from Krzysztof tidying up the
location of MODULE_DEVICE_TABLE().

----------------------------------------------------------------
Julian Braha (1):
      soc: aspeed: cleanup dead default for ASPEED_SOCINFO

Krzysztof Kozlowski (1):
      soc: aspeed: Move MODULE_DEVICE_TABLE next to the table itself

 drivers/soc/aspeed/Kconfig            | 1 -
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c  | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)


