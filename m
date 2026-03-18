Return-Path: <linux-aspeed+bounces-3713-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNE9JFtaumnFUgIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3713-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Mar 2026 08:55:07 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B72B74C0
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Mar 2026 08:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbLhk6TRlz2xYk;
	Wed, 18 Mar 2026 18:55:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773820502;
	cv=none; b=UaDIMQJNWJrtSJhN5YNIEVIFInWkQ+ppmnlMCb8Ek7Rb16iWSLFUqLnnzIOusn4GBpLBLkRex3nCoSxPtCQcwdZTYQgxbaDh5STxLnNlVZql0rm6p/lhU/EjIJv5SYm7VK2PVxHgvMSFCYtJJKqgEshizfYeKFyoYg/Y1rIJdYlUfnKNgJmk5EfRUSHzqnhG2S5kqp0EOicDI2b6LwNNm7B9HxDIAM9h7/sx+sujLo+GlxYA1VfMy5UtaTx5ic+qZhdj/JR3smVlvfk+aMCnMFhcKvLnOoyDgHTD+ajk3EF3LQU4BC4Bl3V6JZZQaSyw64qiCXD4XJ95mZiWydymfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773820502; c=relaxed/relaxed;
	bh=9u8xsagI/WB7hps/pkrbDM3dKjKxb1MRxDzd+RMK+IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbl9fUhOTalUzXIbMuDTo8wF6A4x/Tevid6qgKEWoTUvDRIfeelw+shJAN2HTOm9BPdNd6cdwR7zgqtHfPaItrVldn/lVSV4cHUMTFL/wbI6TuRTrxp4G/prf9L9lKDttkqQVoyWknUZ1Vm/42M+L0yTecamFp15VcDDkqbdbWPYEroEcKZYDRjjk0xOqku28on55QRc0tZtolTMFRsrKwimmfrMzacUjZHlf1vNxY6Y9mNQ3S2uajjW6L4xTLakqp8+RWL6qvdS1gWRSjJJmWrCHnMDlNs4MNU905ZabwLe7QQgZmIwg5IkqM+OmdBQISCtAwkKaB/Z7j66+GLkUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DrmaJoSL; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DrmaJoSL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbLhk1TzMz2xQr;
	Wed, 18 Mar 2026 18:55:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FA85600AE;
	Wed, 18 Mar 2026 07:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73269C19421;
	Wed, 18 Mar 2026 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773820499;
	bh=N6cd1DK0Kllt8jT0L6RRnZfk0S+Wf0Q5OKZrj6RgUR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrmaJoSLYjPRCs7DRpxicubv3U5QaPhq+488+AQX8dcYmEavnuAOs2G76mN5fFOIq
	 6bpAl2gVrXOgbV4z0l9rTcTULZKFmGYPPMmJ4JFwvFZ2iIa0UAOB+qXWu+MzVap2dc
	 x5UwJCt97AiEpGSl7jyRpvVUUI/aho9cN6IG71u5w8Frm3CNbSGOvh14b3ZR5tPBtm
	 xVVODjI+b67MdwHxPFaDGAttosT4cTffNeiXeudYIWxeY0JPWa2UxgGkXloXxCS4xv
	 BTk4MBcsyYnj63QpdwFnQjKcwdk8w5dwiO4fqFOC13f0fncEZR5NaXP2dC0nfoztVX
	 kzfkTOHd2/V0w==
Date: Wed, 18 Mar 2026 08:54:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mmc: dt-bindings: sdhci-of-aspeed: Add AST2700
 fallback compatibles
Message-ID: <20260318-abiding-sloppy-poodle-efd3e5@quoll>
References: <20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com>
 <20260317-sdhci-v2-1-39b1f063061b@aspeedtech.com>
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
In-Reply-To: <20260317-sdhci-v2-1-39b1f063061b@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3713-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,linaro.org,kernel.org,jms.id.au,gmail.com,intel.com,pengutronix.de,aj.id.au,lists.ozlabs.org,vger.kernel.org,lists.infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email]
X-Rspamd-Queue-Id: 9D7B72B74C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 01:56:42PM +0800, Ryan Chen wrote:
> Describe AST2700 as compatible with the existing AST2600 SD controller
> and SDHCI bindings by requiring fallback compatibles in the device tree.
> 
> Also require `resets` on the AST2700 SD controller node.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v2:
> - add missing blank line
> - modify ast2700 compatible items const

Why?

> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml      | 39 +++++++++++++++++-----
>  1 file changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index d24950ccea95..9c8e068964a1 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -22,10 +22,14 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum:
> -      - aspeed,ast2400-sd-controller
> -      - aspeed,ast2500-sd-controller
> -      - aspeed,ast2600-sd-controller
> +    oneOf:
> +      - const: aspeed,ast2400-sd-controller
> +      - const: aspeed,ast2500-sd-controller
> +      - const: aspeed,ast2600-sd-controller

No, previous code was correct.

Is this some microslop LLM product? I questioned style last time and now
we got random changes without explanation.

Please confirm - did you use any LLM microslop tools to create this
patch? Please also confirm - who internally reviewed this patch before
posting?

Best regards,
Krzysztof


