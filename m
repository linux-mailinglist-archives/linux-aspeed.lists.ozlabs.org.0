Return-Path: <linux-aspeed+bounces-3409-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIcUEdi3b2kBMQAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3409-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Jan 2026 18:14:00 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A105D485C8
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Jan 2026 18:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwYnv5fxYz2xQB;
	Wed, 21 Jan 2026 04:13:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768929235;
	cv=none; b=l1SMPeeQUpNqhdS/wN/tud4ELKyafFlgy48WFK9qwJY6yBnjtirGx59ZBLJXIe/B6npkEcFnMHv1f1eQ5euppWv+RajucTJbd69vjeGWbfjqmnzzRTb19+xf1X6WXmvzyCLn1aaZRs/kwG/nOzlzCqI5cRaH4DG6QXvnxVZ3Zdf6IdUnANtxIACWlIQhbwGpI0QIS8jk6ceWKEXHxlhgxh3nK0H4wi9YJdvJ20kedoaDLUf2Df1cXVi6n98zvVotV8n8+8V9NYBrNgoOKGO1k72CP7Y6WALoKphNN9bjr9xQBrWV5A6xOl43qVB5aRaL3eYXeHSHnFXIDfm+v0WhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768929235; c=relaxed/relaxed;
	bh=l8hiawV26Vv+bQT0ragLMCSj+JMcDW/G0WxHYmhWSSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KtpHa6ASU2b7ZBB0x5Jca96FVxYmBsDjlhxtZi7rWwU+8JTZk8FXy5+SE2g2kkUoCD6j31vV4bPYvNKxRpctAIC7YWOI2ycIk97NQ7JobrfSRRAsUeDsmxdqdkAgFva9QqsNNelS7ME7oJIChPNUK2lm/TdzRrbQaI06uTVFa6XGVyzXUtS0XC8DgZf30Yc2+Umna3+TBhFAYxSJ6w+Z0T2V63VF2maoN0btkKw3ab0IF1e+I7wD6Nbcs8yBFcB8YHEqpBTOgEmi5tMVzRgNiltnr+KmfBCYyYEFAZpPmxWsZ7A8wQ/azo5gDv+p1X5ZFFd9SVr3b0WLSPSp67RDNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZN/OaL86; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZN/OaL86;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwYnt6Qtmz2x9M
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Jan 2026 04:13:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26D8144063;
	Tue, 20 Jan 2026 17:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F143C16AAE;
	Tue, 20 Jan 2026 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768929232;
	bh=FCXUTifsoE5ms3846pZc5X2+cn49qG54H5gxPe63MiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZN/OaL86bOdC6IT7QGy65HSNIb4kEOeBIdUSX4/ywGgfkLO0g/ysRy+uUCedRSk6L
	 /7ldB+MuNTI8ZN6BAobOyyExx/lJYLUv99rokkj0ggeP9X0MOjvEoqNRg3rx37/ww4
	 AkM3YmkKZQJ/1Dlq06eEgKdLuwLvu+2P9rHbQrdfqPD8EPsTrpOcieAgTo+B6z6C+v
	 oyWLQJrVJ1t7QW+Fvmg8cnUr+chDtH49RJer6ZIxDO8gPhzXst88+PFikgTSAsgBss
	 IFwDX/6nyGE+R1dtv2Qz1MpO5QRuygPNb/KnpC2z80oOT4cfGpp1mGhCFPlmXbXzil
	 u8IvFZdYw2gfg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
References: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Document smp-memram subnode
 for aspeed,ast2x00-scu
Message-Id: <176892922879.2358656.10600094966614086692.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 17:13:48 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-3409-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:andrew@aj.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A105D485C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 09 Jan 2026 17:05:18 +1030, Andrew Jeffery wrote:
> The platform initialisation code for the AST2600 implements the custom
> SMP bringup protocol, and searches for the relevant compatible. As a
> consequence, define the requisite node and the compatible string, which
> in-turn tidies up the dtb check results.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: Document smp-memram subnode for aspeed,ast2x00-scu
      commit: d9c80c6393900f810cf30fb33f93c7f762c0ff4d

--
Lee Jones [李琼斯]


