Return-Path: <linux-aspeed+bounces-3497-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EkQLOBliWle8QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3497-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 05:43:12 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72E10B986
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 05:43:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8XBM4rtZz2yFm;
	Mon, 09 Feb 2026 15:43:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770612187;
	cv=none; b=iuu7/WpMGMlliNgzxGsziKL1+haRNx8pgeTlNBqRE8yq8+Ayc2jNnpFwlTgOaCc8Dkw1fsXCUqILq11yOyP7eLtk2Z49PdPs00bOmHb572vOzv74oJXATlkTLRwpXi7BpfRV9cphJbVzIvQOfmlbu754BLOWWry9164eJZTzVYjKFrUEdBj8wy/OQfBKJUkRevcSvyZq5NbyI32jwv/jFLfizdRej6LsIMF3dMsXDdLbuNYXzlbPhOhyorP8lbmWJ9N0PbGl741gpLyUe1PB5zoSZoFZPf2eRpGM4foA7HoHKz+JhmS5tVxIVed1bWWVFmKtQu7DSJ+X5w6b58cl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770612187; c=relaxed/relaxed;
	bh=2EDJMPOdQUIkj7B+MtnJTuwRWWsGcynJpHj9KDB1EX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J/fxnm6WfKYOh8b77NJ0qFhSy9wJS8FhfBMqt+w6CKPQIz6uYwlrdECzT3pfxvCfqz+ib1s+CtJ6vQCr55ysCPTgc9+YbetEkaVYXxfUzcbOQLHPOYvLCWfvjW+8STddG2M6GsDuK3Gr2tPstFSE0JQWVWIwj5HOqxjwbPcwtC81TW+gNnkpEgCtgdLqhYUwyUdiG5qTcVLeeCtMqBFcHRGwyjrjh0xo9laeL5iF5dIAEfQQVBJByzUHtWuYnHLTQNpIZElVAspOhc9wt4DlEBRqCrS/XTHrKgfJVZLyB1u1G760vH4WIwEqrlcPvpYRSNbEga/rtSC7q2VyW7P2+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LM8TiHiw; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LM8TiHiw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8XBL6J9lz2xnl
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 15:43:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770612185;
	bh=2EDJMPOdQUIkj7B+MtnJTuwRWWsGcynJpHj9KDB1EX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LM8TiHiwLMi4JpxMmygPXU2C3mwSlUbSkF43jtqGvY2th0eP04oho0fdrfmkx4mcq
	 xcgN3b/mtuH2h2wFxPyNmvGSGK+WKhPzBcWkMKcuHXCdZ61nP3EUf79QvNuneU/+sf
	 VjnRi5Ei0q+nYEorLZxdK05JaAEDAFLn/UyGklTE7GGSpLhnBWs+SqPiXWGIsCaqww
	 ButJkpEb+LhtcV486396eGDPbQUQMtvhsVwlRROTMNP8cna4h1Ptka2z2Qm+b++PWN
	 XEGLqThGTkVwBnMkCWIYNoIWpltFL1tsB0GVyQYXYNt1H+BonrTj69NeH66xgOG0U9
	 WX+t4+RYVhRmA==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 72C846024E;
	Mon,  9 Feb 2026 12:43:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Marc Olberding <molberding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120-alt-128-v4-1-0e5c491a532c@nvidia.com>
References: <20260120-alt-128-v4-1-0e5c491a532c@nvidia.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: add an alt 128M flash layout
Message-Id: <177061218409.863052.13158700639798064370.b4-ty@codeconstruct.com.au>
Date: Mon, 09 Feb 2026 15:13:04 +1030
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
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3497-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:molberding@nvidia.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:email,codeconstruct.com.au:dkim,codeconstruct.com.au:mid]
X-Rspamd-Queue-Id: BC72E10B986
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 12:34:14 -0800, Marc Olberding wrote:
> Add a 128M layout for the BMC flash chip we didn't boot from. Including
> this allows the user to write to each partition on the alternate spi
> chip. This dtsi follows the existing standard of using the same layout
> as non alt version and prepending `alt` to each partition's name.
> 
> This patch also adds this alt spi flash layout to
> aspeed-bmc-nvidia-msx4-bmc.dts
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


