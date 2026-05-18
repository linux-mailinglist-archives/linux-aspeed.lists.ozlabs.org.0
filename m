Return-Path: <linux-aspeed+bounces-4048-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAjCKdSfCmp14QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4048-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 07:12:52 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C390C565E9D
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 07:12:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJmCP3kCfz2xRw;
	Mon, 18 May 2026 15:12:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779081169;
	cv=none; b=MA6AeRNsYvzQyiaVUmKY9z2HWbGIbapkQnynkWH61B5u7vajPTfcl90poHLphV8hUvqMctrY3MBJIMXkB7jnoG5+mBrbV0K/6v3nZcisZAOAF5oNQ6C9GHA19mNdvtQDX7/FHpAz9JuK3Vxn4BzX1N4czZjB/fEOXba0t0InzzDTBeo5wX5cP7QCK0MM989EY7Aa3DRtubHrwy2rJOhgsk/6JPr2rSXHv4p8aqWCtsgnhwF1+RTcsoEj5la+OCVpX56FTPWMb/6iUmyy/AjtMxY1G1Imp+qi2kLxjmY1YeOYWfZH84YDj+HrVEs3bs6ovQBhwoOaBtNM6pm00oMfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779081169; c=relaxed/relaxed;
	bh=i2PykgTZ59OqLYyaVj3A9+ycwaibzO5zZ0kF4EM5pJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OuaCfVP+20MwyQ3RLzp5BXMOEzpnm236vTrH4PVK3db4aFKb1DWn780UIeeoQZ+ho7MtJi7R+6hh+xwD8Ul6o751G3I1Zi0sYIqGVsaaPUVHWUekOjO7hHkkkz34JgKIoaRfIMcSTpSrcndUI1M/0iRtxfWwl9PDoYXBvTLYAU9T18AXX7eMC4myUYrglFr8cBJ09klI3KOux0/S+BhpCDf4UEMfZjbeC9niohr7El8KJpK5VQOZyKPzyQHnRIPsvL3HwaBQiGCOkhhVgVJ9o0PQpHbZbktQXBnNv3yI4LF75cimrNmJGdSo9FiPopY/6IY+eFBmx00rHcUab4TQWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aPKfRaxl; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aPKfRaxl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJmCN4rRyz2xPb
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 15:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779081168;
	bh=i2PykgTZ59OqLYyaVj3A9+ycwaibzO5zZ0kF4EM5pJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aPKfRaxlpjRjX1lxwyOR0yHKYT3GuwmduyuUMuIz4evV85Lhyye6c/jHOGUCIdNvB
	 S5xtRrhGTLc5RP9pZSglxjsFBOPgX3ieP658Ou3ACBnx3XTLEhi7vRzYtNdUxh1jdd
	 kiCOuVgYeX8VSaa4gw3E7ayvZX/tSsblwiYJLdTckSrGK+HNVPXYVJO6usfs3MkjZV
	 ojMBo3aCxP9DfhGbNf4LAtgcZsy9ckbl6CdtoSY43nftGwYvVtirenIYoGO6GdO3s8
	 MokfjlSrD/lpiqfqLxhwqQe02ke9lSoyIK9FhXefC5zhcPSpWJhchdVLbG9MKNNbGA
	 oSII5YKFtnUgA==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 97F586025D;
	Mon, 18 May 2026 13:12:47 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Colin Huang <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com
In-Reply-To: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
References: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: add JTAG CPLD TRST pin to
 SGPIO map
Message-Id: <177908116750.1269230.16667761190075154399.b4-ty@b4>
Date: Mon, 18 May 2026 14:42:47 +0930
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
X-Mailer: b4 0.15.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C390C565E9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4048-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:u8813345@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:email,codeconstruct.com.au:dkim]
X-Rspamd-Action: no action

On Mon, 11 May 2026 17:47:56 +0800, Colin Huang wrote:
> Add JTAG_CPLD_TRST_R_N to the sgpiom0 pin name table on
> Facebook Anacapa BMC.
> 
> This exposes the CPLD JTAG TRST signal through SGPIO,
> allowing proper JTAG reset control during debug.
> 
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


