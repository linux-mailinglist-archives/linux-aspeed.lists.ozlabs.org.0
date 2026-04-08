Return-Path: <linux-aspeed+bounces-3871-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHyLKCDK1mkLIQgAu9opvQ
	(envelope-from <linux-aspeed+bounces-3871-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 23:35:28 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A13C41EE
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 23:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frbvc2Bdpz2ySV;
	Thu, 09 Apr 2026 07:35:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775684124;
	cv=none; b=mwDo7WYyfzpyztjVYAcTWz26VFjM40fFS8F3h2exQOVcYukMRU1XCUmsehT9eEHQNLDOZ79l9lF/kjtEZ7MWn+7gfPV34FE4ifWB2T2g5OkhnRBHy3+A+xIVpzJ71jguD274GwUOQ3JGYfggTmm2QsL2bfoKIMKPWISvnGzL5r1TTKMXG97Ftmu/V707Mq/h4Jow+ENQBAY7xoNM/B0E3cu/NXVKx7hJqWP7umfIFBQvTobFTgjr8bjkUQQF96jwuzdSTHBnGQoIse34OvCDa1dd6p8PgXWBAONniQs3m8Uq+yTN1w9shpcKxDgEVGe/1JrLVswWI7O04LXmyCRP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775684124; c=relaxed/relaxed;
	bh=y/ZDmJFMf0pTjChgKNi4aVpSQoennJ1xMK8FbYsVCis=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mEcC0EgwtDyJz5ZcV6T9D01yRhE8JBPaBiNf84pKTCMl0Nvg5fJ/ZEVXGs8TvLFJR+Bm4g/wObOHU8rBAdXtBwH/Jlg3PbJUiHDaj9l5nMfGl5xxBxd/LHUFamzu2Vp4Ken1b5fatpbC1BKLNLFDhWlgZhNuyxYietI7I52DxxLA3mAWVngGGKS2O7CNRWCEsRbedfSV3soT9L7XOtd/92wgkNgsCL/+J9SjlHGNQc3XW5je9tdgnobR04eCjWe15DJceSZnfS9p/erugZuusxSBZdfnIAj41CicHGK1P3mBWNFQcZbQIxbmtFmXmaK2ASBdJXPLR1r2AN9fFDQnmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c8Lz1avG; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c8Lz1avG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frbvb0NP5z2yC9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Apr 2026 07:35:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35E0B600AD;
	Wed,  8 Apr 2026 21:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921BCC19421;
	Wed,  8 Apr 2026 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775684119;
	bh=U5m8hCve0SToPzGN57qTzQp7oW2CDN8d/H/F/Gwr1gk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c8Lz1avGo9y/3VwFqk+vg4C2dwokvPKM2kRCkByp3XrW7RZDSnYhczOJwfkn5J17L
	 fZPiEDIAb2KROGCWUAncAdHDC37/G9H+3r/bDVJyxxMaT0qqLf9fZmz7PzP1madm3h
	 Y/XJsLkf6KaJAK845zD1MKfM7MnRVciZJENhnfgD+0aaBr6QVYJIPfrZ9LDk9WaW2B
	 +LWfNPwjYgAEpol/ft2FMPoaAZFaqgynKvrqrPgXPkS7Upr4LNOd5/CxKqPUIP1kjq
	 xxCp7IN2bqWWAIAFgZJG98ZioTl6cU/Y9ZeSVkPWh7bnLWcoHLjT/nFmSJvbuIQ6z4
	 dYmBPC/7/qxqQ==
Date: Wed, 08 Apr 2026 16:35:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org, 
 Maciej Lawniczak <maciej.lawniczak@intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org
To: Dawid Glazik <dawid.glazik@linux.intel.com>
In-Reply-To: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
Message-Id: <177568411772.3278896.3414957895375606965.robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global
 registers
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3871-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:krzk+dt@kernel.org,m:joel@jms.id.au,m:linux-arm-kernel@lists.infradead.org,m:Frank.Li@nxp.com,m:conor+dt@kernel.org,m:linux-i3c@lists.infradead.org,m:maciej.lawniczak@intel.com,m:alexandre.belloni@bootlin.com,m:linux-aspeed@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:dawid.glazik@linux.intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 126A13C41EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 08 Apr 2026 22:34:35 +0200, Dawid Glazik wrote:
> Introduce the device-tree bindings for I3C global registers found on
> AST2600 SoCs.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> I wasn't sure if I should add newline at the end of the
> file or not so I took
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
> as an example.
> ---
>  .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml:55:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.example.dts:27.35-55 Unexpected 'ASPEED_RESET_I3C_DMA'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


