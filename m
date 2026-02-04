Return-Path: <linux-aspeed+bounces-3475-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Sqr0LB3bgmlRdQMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3475-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 06:37:33 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A78C4E208A
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 06:37:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5TdQ0w3Gz2xJ5;
	Wed, 04 Feb 2026 16:37:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770183450;
	cv=none; b=PA9g2Q2yYvGaqzWqAPgKLoX2ffVa5X9cAK080krhzF9u3nWw14aCik57Ik6KsrfWbng9h0sT6pb9/PmRXbrK+XtU+DFJZVacF9WItohHNnzzfEjOmYFVbhTv/HnXskm3gu0bC3QVar/cxfsycvMKlgzMBL+ZVPOFw/UN3Eswd5LbUOJP3xgcRxCpRt+azFcPR1Hr+fjl4MsILjics3dqfpg5EShBWRbj1AXnJhvRqOyHU67j8lHRkQrX1WfUkzVu6NHZrgA6fCeRJ+QxEWYK5XkrTpMvIZV04PwsRwvC5WMW9d0+6/ZXs/lhiK2y8rsRaVpudxHzoi0AQTtCeOR5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770183450; c=relaxed/relaxed;
	bh=EFcwzhh7o8K49qee07mTb1ZNamBqMLC0xMDOttqkxoc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=m+JFxBDV4K0d+3VFs3vxxetBaQVETojqj3dgtwXOYRZSx17CiB6vZvS6bvw0omMoNqyK1yBOAAayfLxvVqUPXUbwQky0n4e4uxNNPV0z/08pGnFp4U1yAm7XdbgOPtCzYmsxchcMxz1ZyJ8f+L/q4bCY3XMDJjrL1T9pGlpbDBSapsgMv19seCP4QDR5UpHRucoFl1Kw8h2tpIPvDPWOfpg8i2jJq0fxEmn+NMnI9p43Q78RWGTbm0JiBFyP3/PUZt9HK6g1/IDxlhpOzR8qB3fniqdevIPO5YkO8bxInyGUmHqIawJEk1imBDKcqIMopr+w8tVrlllsp+qMDXYszg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFuEwu/9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFuEwu/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5TdP4gPqz2xBV
	for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Feb 2026 16:37:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11E8944469;
	Wed,  4 Feb 2026 05:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BE6C116C6;
	Wed,  4 Feb 2026 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183447;
	bh=EFcwzhh7o8K49qee07mTb1ZNamBqMLC0xMDOttqkxoc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=rFuEwu/9kDzzBtD8Ll5QgwLXf5hxKzaNTh8vznwgOmu4RJbvV+oetgIpPD9YV644J
	 BcfpsIVJiZNVsaandhKHKQxL9QatAxDOJKgU8KN1CWB6HaRhxEREez4xr2M7iDZ7bU
	 cJqfKh+ilD1aoICMlqm+tMvXuSDDadPP6BuBvjgCNJii2HW2QeLznHyWPUwmkZ+hTH
	 Ni4yYewr604F2Jwlgv18Al3GlF4zQ+Jz7H4aJtzF687zbmxaX5QxXVQVsJtrXZ9wZT
	 jI6V9LLr6NS4EG/u4jiPZv6uOeer07fyZPoUphi9dxZZKHBfdIdWmdl783vRJbPCch
	 jFwP8a9JdOQ+A==
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
In-Reply-To: <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com> <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: aspeed: Add VIDEO reset definition
From: Stephen Boyd <sboyd@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 03 Feb 2026 21:37:26 -0800
Message-ID: <177018344610.4027.10487603254575363313@lazor>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
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
	TAGGED_FROM(0.00)[bounces-3475-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A78C4E208A
X-Rspamd-Action: no action

Quoting Jammy Huang (2025-10-02 18:58:44)
> ASPEED clock controller provides a couple of resets. Add the define of
> video to allow referring to it.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Applied to clk-next

