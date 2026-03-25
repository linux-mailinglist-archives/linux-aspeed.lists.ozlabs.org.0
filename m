Return-Path: <linux-aspeed+bounces-3760-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB2QBmU+w2kFpgQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3760-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Mar 2026 02:46:13 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826F31E649
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Mar 2026 02:46:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgV9p4QFdz2ygh;
	Wed, 25 Mar 2026 12:46:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774403166;
	cv=none; b=MkyvA1EtrqESPefMzuiI9MAD7UB2yyWwNOzu4hyFS8b1C5t9cmBju9JKYWLMREHsrwPBE1Y/C8eHh2C+DA+uPtR4f2O6eOy80FW0r/JDUt68GPWhNNCHyNWs6jLYV+N+1mEkXircyMWCOQva+FCCQBh4kB3r/MXUPAeDkrTxuiSKShSyVPi59CQdqWPQ4JDKhJaLzXOw/ooznPFXUelxcumWaRGuPWPg9nUOMyLkM5GxvUGT3KaLB5aSoFDWDjweGzP5GclzKSh6AS+tjCovV6supQ+M3fZNncPsWtvmq+5TadrMN+78S2yBWoe0HCOi2mjzWY98X3CaEzTGCOnYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774403166; c=relaxed/relaxed;
	bh=07p2AHTHoMybNDBcsrSuuplzOKpydQ2b3XLkDqGvEbg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JKXk8W7CgJTFq2gWPhj3a/QNBHKy9Ihb2jbGBhNDQTMXKADAGbCsxywwR4sqZkQelCTtwPPULniDke2/dmX9erKrtj++Y56dpT8nb0DGo3aMQdzpD4Xui6oR8pCYW95Fkubi0FQbR+M5ahLovD5ZTaFYJ1nQgh7j11nQct99CQfGhYcDgM6zfKRAbTzlrOzg43xCFdmHzuR12t1kczpVL2DY+2+ukF52hw0gc36rAw/sigM4jt8+rOQsHShlpAhSrEu6jmtfhse3jhMg+azB+5IO4oRn2/APPln39NPE8Mm17zj6pkVwuDzuAbuPY4re2kUoPyjhTqZ8uF1Rfbj0nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P44exNmx; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P44exNmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fgV9m62DFz2y7r;
	Wed, 25 Mar 2026 12:46:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3951260103;
	Wed, 25 Mar 2026 01:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82E9C19424;
	Wed, 25 Mar 2026 01:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774403161;
	bh=HvRVk/YPY3gKc9XAyt9raBZ1qgC/+JELgZiZx+SJ6N4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P44exNmxQ70a5hsAAw7auqSfc7E3xhP6zmBLbY4VKOeDbOBlza3XzQg6kWsfAEFW4
	 cxI9ZsxnlQhX9NxVYWkUAdeng9+r8dhX1Mr0hig5YUDL/Yr8c5UPAjWhSxiW1CCZ1D
	 qKBJyAingduujPrMri2ea23aolKVEqeXU3CUIvZEVczw73geOtQ5rqVYe4vxQW1PM4
	 KjkJa4P0bYdQY4fC6Yk1YdbFO25qrm0jaz73De8BF3IAnl/pleeGI6tadvBh5ypnE5
	 K92aL6SnMpHQUMSE54vM7nGYX5crg96AMONStV7M3W1ZL1M/1hSbrRMMPsY238m1GR
	 q/XKQSgLSUtIg==
Date: Tue, 24 Mar 2026 20:46:00 -0500
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
Cc: jk@codeconstruct.com.au, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Rayn Chen <rayn_chen@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
 andriy.shevchenko@linux.intel.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
References: <20260324-upstream_i2c-v27-0-f19b511c8c28@aspeedtech.com>
 <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
Message-Id: <177440316087.2477729.6574194979133287654.robh@kernel.org>
Subject: Re: [PATCH v27 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3760-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.80:email];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5826F31E649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 11:06:27 +0800, Ryan Chen wrote:
> The AST2600 I2C controller supports three transfer modes (byte, buffer,
> DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
> method per controller instance. Also add the "aspeed,global-regs"
> phandle to reference the AST2600 global registers syscon/regmap used by
> the controller.
> 
> These properties apply only to the AST2600 binding and are not part of
> the legacy binding, which uses a mixed controller/target register layout
> and does not have the split register blocks or these new configuration
> registers. Legacy DTs remain unchanged.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v27:
> - change aspeed,transfer-mode to aspeed,enable-dma.
> ---
>  .../devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.example.dtb: i2c@80 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,transfer-mode' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


