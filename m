Return-Path: <linux-aspeed+bounces-3483-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIlaDORFhGk/2QMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3483-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 05 Feb 2026 08:25:24 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7CEF662
	for <lists+linux-aspeed@lfdr.de>; Thu, 05 Feb 2026 08:25:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f67zM6bHxz2xrk;
	Thu, 05 Feb 2026 18:25:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770276319;
	cv=none; b=id5T+hHNitm6aKtzgeJSX2W9jf8D/AAzNBQbJnwXpEwO+rEhrv5XM9QnbBRfg2gGgPzGjSLoAFQeUUEmI9aj1UkCSfzkiBudgBvJ1ZW6J2tn9JAFAuR3qSoPhHCXUHPY8niljYEeWJR1QXPE/elBumtTck9wz4pwDLsah3NN5uURB1yF5MnEvFYjzDFRi8xWMH4S7XktPXOprHiPslm5g1Lb90sf5+H3pPEw8qJqr91vaT6CfvnwVD5B7JDpN5kSQ+wFL6Sm5rg2OyHB5l7wSdydzuvYV6mSdkJd33FioNh1DE0lrb91KaHfdBHA9lZeSYzEdd6cCJ2HUpt7Nn+dMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770276319; c=relaxed/relaxed;
	bh=QeJM6sG3siykMwVN1PC9c5AUv5Vvbc5E0C+Yfs960qs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=m6zc0Y9hUNYNsl+c5w8qyJfH8hdYuaGIwx1vzPh4MvBVo82WOaxD9sNDSm4PkfaDZGPbbkruhJl05ht9u4BVTx6puAfHwjAPd0PH+ii+bfOMVoVe+1mZLFfBwyuOCN2pNetEpSD2PJfYksKdl01RBbBD9lxhDXnXaRsHyzBdzrdtSSw2GaJZgAD5slOd8XX9tQJDEzJ7iC7bHvPnpHr/rwQDzu6Q+7+1ypQ1ub2lrBfC6Eg3RqZ/2gZ1Jjjp6/6Ahx77IjecpmkohAc2S1Rw/YZ6gHWhvVcO1ZaR4cLu0SSYXlVmAKdgcHa96yaWvnRZbEG6Y9qwkYDnFq3PTtlf/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NEuiWOoA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NEuiWOoA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f67zM1tD7z2xS5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Feb 2026 18:25:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0592441FA;
	Thu,  5 Feb 2026 07:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B412BC4CEF7;
	Thu,  5 Feb 2026 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770276316;
	bh=XU5EtDFAlpiOcF192k6bjTw6Y4UVTAujOSvnW603CLI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NEuiWOoAcszY0gDKY6U78AtLAaogMF1NFVu11Vf5EBI4RliU3MKTGFeVySCyjSNzS
	 XneKWztYDq5z558h9OUgy+cuUhjh/OfeE7Qq31VViJiHI5uPtR2W3VcGTzOcoT/6pG
	 PR/0CIsvFtjegS6Mix0kc8wMinJItVwqiPAq762/3oOSeQvK/OxbB2Rr2P8vb9Olcj
	 oDrtpLZWZv6biNwp2VP1PFCeVGCS+m3nxeHpMy5/y9iCOpQdkX5+Js7FuoE/ObOMEM
	 dyloVuNc7zsUsKJmWZzijTEl0tGgwJnTWZdr8gZDZXIA4tq2Qhfj9PIWR4CSwScNhc
	 /wxgE3dHiUcZw==
Date: Thu, 05 Feb 2026 01:25:15 -0600
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
 linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
 Joel Stanley <joel@jms.id.au>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor+dt@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
 <20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com>
Message-Id: <177027631587.4038923.11644467926032419641.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: aspeed: Add
 ASPEED AST2700 INTC0/INTC1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3483-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:palmer@dabbelt.com,m:linux-kernel@vger.kernel.org,m:aou@eecs.berkeley.edu,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:pjw@kernel.org,m:tglx@linutronix.de,m:linux-arm-kernel@lists.infradead.org,m:joel@jms.id.au,m:alex@ghiti.fr,m:conor+dt@kernel.org,m:ryan_chen@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[0.184.161.160:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[14c18000:email]
X-Rspamd-Queue-Id: 9AE7CEF662
X-Rspamd-Action: no action


On Thu, 05 Feb 2026 14:07:19 +0800, Ryan Chen wrote:
> INTC0 is used to assert GIC if interrupt in INTC1 asserted.
> INTC1 is used to assert INTC0 if interrupt of modules asserted.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-interrupt.yaml                  | 207 +++++++++++++++++++++
>  1 file changed, 207 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.example.dtb: /example-0/interrupt-controller@12100000: failed to match any schema with compatible: ['aspeed,ast2700-intc0-ic']
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.example.dtb: /example-1/interrupt-controller@14c18000: failed to match any schema with compatible: ['aspeed,ast2700-intc1-ic']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


