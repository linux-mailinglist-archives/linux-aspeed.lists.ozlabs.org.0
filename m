Return-Path: <linux-aspeed+bounces-3867-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCoJIkoJ1mlnAwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-3867-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 09:52:42 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75483B8963
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 09:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frFfB1crkz2yVP;
	Wed, 08 Apr 2026 17:52:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775634754;
	cv=none; b=djleYFdBiCUJQaK+iZVJVLLTgtzehkntenJ7hBzxtXPdvkItAyCl4Xr32XuBORH9l71Sbl30YzGr0PFPJctBPEZEf+9H6tlMcva2s7qQMlMAlamNtDAeFGhE76R/caman/t/7bSPnT128e4K2qtLV4t/+nCRmzQmJHWZpK6QyWuMSG/aVlIDnryRdYHit3xF9wi/XaayaGQWgvluZqlW28Av0AQv3ytP8yR7i4LFUzpKFLJfSzYbZi9oXaMvODfVDZmzJ4gC7gDBSxx8zCm70TaOLIqEouO+2R+icChSmgMmd2QnMSFks6VL4i4+SioxX3wUW5jgDDzT2z6C1L+r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775634754; c=relaxed/relaxed;
	bh=dJkcrKpMsomWsfu3HRoQuW6Uqe86+81cvDsG/ByrGck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDmCHMqcULk5o1lNrOqOv7jB1NJPvVZXnjCZIrQzN+SJ5mo+As7TuFw3X1CaejL/V4rVey7Tng43yMpp+E3JCsgbjZF+2ywx/VfvROhBRjfQy4xIMpvg60BMwAtnCn8s2TtC3IY12pdZEF0sCsqiLyzgX5edKcPZmG9zGOPKcWOcr0Tp6sm6ePsK4GDNqhCY3XyHC/+lWBf+EuggcS42VFkHgehwfJyp/6qxAZxfi7yUhCHat7xtNsuvSYiHeYOYGXcA/1PO45nU7cvCR4l3oe0XgCohFofxF3oFaJbau4fF60/c86CCupb+uWcEYV360pdYmL8GfW2voDfIsOzWog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ih4NSeC2; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ih4NSeC2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frFf92nyvz2yC9
	for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Apr 2026 17:52:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02D35600AD;
	Wed,  8 Apr 2026 07:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CDBC19424;
	Wed,  8 Apr 2026 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634749;
	bh=xNY9tEvKoYhfTQH3M8/Q4r7s7A/d71rffbc/9uF1Xa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ih4NSeC2UtjrjEgv+qhj7RtI0dtNt/8E6c+4i94k1Sj4TamaIc7W7ZxK5Nm3QtmCC
	 Vd760WYlfNXMixdwpwsP9oZDAvw006FAcAu3INDBMcTNgYdsHgQizXVaxgh+9qQrDi
	 aEOoCclvi3jirOCzCYmkZ4X/4BZG7dPnqnX2ySRZSg3/gT+sH+q6ZQgHd/0VtTlVwS
	 H4dkYCWlUU8f9MFq91Kxjd18brVjj1jF81dUN5DG2ePwLMEu/HVqu+5IlOSSFpbBjW
	 aBNIQQthwmBjWJCTX63DLrRjrLEsatuBMFYVSJ6yGjFIvHfG9DgQMXmEwBfm8Y7xtw
	 LxCvoacfK38aQ==
Date: Wed, 8 Apr 2026 09:52:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, colin.huang2@amd.com
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: anacapa: add EVT1 devicetree and
 point wrapper to it
Message-ID: <20260408-glorious-vehement-robin-b6def3@quoll>
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
 <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com>
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
In-Reply-To: <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3867-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u8813345@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A75483B8963
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:54:33PM +0800, Colin Huang wrote:
> This change introduces a development-phase devicetree for the
> Facebook Anacapa BMC EVT1 hardware revision and updates the Anacapa
> wrapper DTS to reference it.
> 
> A dedicated EVT1 DTS is added for revision-specific hardware while
> keeping a single, Anacapa entrypoint used by the build and deployment
> flow. The top-level aspeed-bmc-facebook-anacapa.dts
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1069 ++++++++++++++++++++
>  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +------------------
>  2 files changed, 1070 insertions(+), 1063 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> new file mode 100644
> index 000000000000..a29b7fa1155b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> @@ -0,0 +1,1069 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Anacapa BMC";
> +	compatible = "facebook,anacapa-bmc-evt1",
> +		     "facebook,anacapa-bmc",
> +		     "aspeed,ast2600";

Test your DTS before you send, not after. Your binding clearly said
something else.


Best regards,
Krzysztof


