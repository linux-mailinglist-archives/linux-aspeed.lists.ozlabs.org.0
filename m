Return-Path: <linux-aspeed+bounces-3474-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DGMJh3bgmnkcwMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3474-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 06:37:33 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69509E2089
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 06:37:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5TdM03wrz2xHt;
	Wed, 04 Feb 2026 16:37:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770183446;
	cv=none; b=HRtYrmiHy4JPKOy8SXg78m5/nY8PvpdMWYrOPFGsj+6u4KGz3dDG3NwB37q8+Q6s+SIw8V94Cnn8WjZdkDhq5W3kRYzXIDaM1HFOGt3gzysKUnw9UjGuouy+F9V245TL1lcwjnTaMWPKYoA8xBJJxnlgqZbMHVww5vTkSU8T51Xa/Hp3f3Tlt5h5peB5Irh4g6gCg1wrRytHZFgWXQJsn/Prx0dDZrNxMNn6pAtRYMZrr8v0ZL9fO33WaLvww5xXZqt1MN9eqFPAJvgS3HqBB5CMTNmuBoUB3tG8/ZwBDUJ4Kq8WhataxVFDphUDtZlgJvPGjkREd05mqTsfl0/R4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770183446; c=relaxed/relaxed;
	bh=DdUNyXOvujvhPt+hXHM1uvHJZ3UgKsPIS+vRCXku+ig=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=gUleQXTCvw0CR8NSo8cyo4uwiUv0uIJknlHTrFE3jDVQLYcDpfOQDBaqzbZEgYaNSZpc9yaPnz3so+EdgpQT06A7nZRMr9YFrTEK9UWrQoMgqOnhzjrfcmX6yB8xr7OzBkvK3Iod69hQTYTmr9y5Jh0Gi5EuIxH3TMAMwGNEwAc0jq57X+yhtBWo8Rbr66TljkZ43+nUvaYq6npDBrWMz1qFaSl9dXncFwO7JhwfM80cpE2nG3uWFwbw/IIpUleZnITUk99hnfAsHJzh10hyLsaxWXqL+E8YuTaG95WvdQJ8t3i18L4Ir+Ms+bAfb6jOyrJyElDI33863xqzof9Zbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fxsq36n5; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fxsq36n5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5TdK5Swdz2xBV
	for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Feb 2026 16:37:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44C36409FC;
	Wed,  4 Feb 2026 05:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABFDC4CEF7;
	Wed,  4 Feb 2026 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183443;
	bh=DdUNyXOvujvhPt+hXHM1uvHJZ3UgKsPIS+vRCXku+ig=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=fxsq36n5ccJTll8D2V0Z1aqU012l7/JwvLvNMdXjDncIAAJmX0c63uLJ0FZYN3Yo0
	 +1CnSRlBLRuOX7xqgsmeN3zEjP9G8KdIzuWXhbnazgqYW5fwKr1+k7NcDRcQ6Brp2G
	 shMYb2y5roWPQdmBQMg8jttozAnyMQ3EvJZbYH0pzRQ5VMtMReZKnqluivJ2Or1A9b
	 1bHovcbErXdOwzoSIv5Snct+ryaf920nis7CSGgFkcEivv1aw0vw0eFGqMTMaYml0j
	 XnkRutUDdS3rrhCS4sbOU9IplV6bNXYufT+A7CbaodtvgjhN70UbfAclUiAuqK7O3S
	 rCPAOtCNBnxzw==
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com> <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add reset for HACE/VIDEO
From: Stephen Boyd <sboyd@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 03 Feb 2026 21:37:21 -0800
Message-ID: <177018344119.4027.5055693146328954429@lazor>
User-Agent: alot/0.11
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jammy_huang@aspeedtech.com,m:andrew@codeconstruct.com.au,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:joel@jms.id.au,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3474-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 69509E2089
X-Rspamd-Action: no action

Quoting Jammy Huang (2025-10-02 18:58:45)
> Add mappings of reset per hw's definition.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Applied to clk-next

