Return-Path: <linux-aspeed+bounces-4428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ByyjEuwqTmqYEQIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Jul 2026 12:48:12 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811D724782
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Jul 2026 12:48:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KFGEJMBq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwFDm3nsCz2xll;
	Wed, 08 Jul 2026 20:48:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783507688;
	cv=none; b=D66g87q7CmI1Qn9Af488Hb7umI+ebAyIuOcrQ7tVm3N2kwIRLo4zW4n9Mq3S5WTZkUJUuj/P0f20lalECXSTi2RasfJzGiTFkJzumI8EQE3LKbBTwI6RSgG/+n91NEY1ML4iE56wtyMNjaUq2qMgq0+ykOZ/L1mPoGut9+u6ILZGM3JB4I98kQUbmHaU39brDuribNRhcFcOP+4dcTBXeuraNV4w//n7hE0LclCzyTWLwh4tIMTxullbLQkL9EpLCy4v9BK5eydlHcP3XG4Dy5vRIv2l/+QADFtEJJb6MJ1P5K9cYYnoIVSxchgU2N4wpjdU5pHz1kNe/7nfmITtew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783507688; c=relaxed/relaxed;
	bh=UnkgHBD26F/8kXqiFVoT59yFz6TX2aNaiI+Qen/RktQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3P3U944ZCV60T2bsvkO7UyialBXCVXB05E8T/GGWnFWpcH6CBWXNh4aMBIywPRB2u+SteqCMalq3kkqcqf/4bBvH18uHCSCiLaYI66nF9JXt5xRSgtOTeG3cU8UGNhivOwKuL/VHP2MF0Gb8xLKdjMYJBUR+2FekO4U+N60aEGDX3pdupCnLW5hDK/VbOns396/zyQCpbcLJOze1Sy4LvbJYWPfpRU591kL1j4P44ndwZedG3TGNUxjUM36h8geT4uo84LCY+2tqPXafcgEH9IavIbJZb1RyNuSZjfr+jn3GWbfQHiA3UVIntxZjYzKmk8vsbliedJcrkNIVRxixg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFGEJMBq; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwFDl0Jwtz2xWY;
	Wed, 08 Jul 2026 20:48:06 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14CEE601EC;
	Wed,  8 Jul 2026 10:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E1D1F000E9;
	Wed,  8 Jul 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507683;
	bh=UnkgHBD26F/8kXqiFVoT59yFz6TX2aNaiI+Qen/RktQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KFGEJMBqQe+PjrBWqjLmjnWV/JsYzB172brSP6VwoHXDx7xS1ZcLCbVgtMXZufrTW
	 9fYrMj6at+MD4WpHch8E9OcjYOFKZ00/LVyYUTTTys/2rkXqJcTS2PcI1Ne6swd7qY
	 XNDdlddJfFCUqjhGtq2n+UD/JstJBmUye+lM3MRgmXIsdbq91QM8rf86qAEwofPVjy
	 eKBOhffTbvdrIWmxVU0k77Artkj8kd3ORRo48Kl1pjc2tlIV1E9kmYiVm1XWu0iU/I
	 XoynEpx7w6VlPa0M62hCCsbaGJV13MAAkYsuolH6YW85A2jqKW0L8p3/MNuBMeImir
	 i+4N+Uy/hIMXQ==
Date: Wed, 8 Jul 2026 12:48:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Message-ID: <20260708-crafty-copperhead-of-whirlwind-1d89e9@quoll>
References: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4428-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0811D724782

On Tue, Jul 07, 2026 at 02:12:04PM +0800, Ryan Chen wrote:
> The Aspeed AST2700 SoC integrates the Synopsys DesignWare USB3 core with
> no vendor glue logic: it is functionally compatible with snps,dwc3, uses
> the standard DWC3 clocks, and the only SoC-specific part is a USB3 PHY
> that is handled by a separate driver.
> 
> Add a dedicated binding document rather than adding the compatible and a
> conditional to snps,dwc3.yaml. This follows the established per-vendor DWC3
> convention (apple,dwc3.yaml, socionext,uniphier-dwc3.yaml, ...) and keeps
> the AST2700-specific constraints - notably the mandatory USB3 PHY - out of
> the generic schema.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

Why are clocks unconstrained?

Best regards,
Krzysztof


