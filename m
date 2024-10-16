Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8E9A1099
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 19:27:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTHwf486Rz3bgV
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2024 04:27:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729099665;
	cv=none; b=Gh1AsKlSWyPNkjcWoIt6rJeie9gwkohmHqN4/xh7oXLc0VT1tF+aFa509UUnKVv/45IUqCLKbw/WmFw5q/jUc3eUbcHdBOHBG3Xs7MqT0aY5It+rr+2filFoDigaO5g/jXGns141luA5dH7JjH7on2Fox7S4vR2wRkDrBVuDeZmuQKYI4Q3Yb6LuGBxfZS2sVSvCWyOQDHOVSB24joVBw3uJegU0lWMPoVf/3vzoZ+4blSirtungHwb2jC5xTQibuUHzjTYKr1Vrz1FOKqN8kNQwfGnd4moZyVvkTtdEp/a66hiwhNB2u5KZoB/h6Z/4Puz+0Np0GcleVmBL5NZaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729099665; c=relaxed/relaxed;
	bh=KRCU1dq1mteJmdk+Xab2HSdeJkY14Uqvh4+Bc2LQEvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwqtA8AON9nh2claBFGovg/6hSRbtX4u0x0JX3Pwa4Cf2puwisRFk4hbShjLba3Uex6RCbMJku6opl6CFmYVV1N1M7hKl9kEBTztYDeZm7/fsj5ALNlRaR0wc7pHSuODL7qv3RG5RigbTvt8ApTr2hXiNSScMGBei1zxDZFg1ch+0c0I+p+DWHco/8KHSJlTriWt57pbiqxwI0FQVajAOrcun4Y5d5uQ0KUlGyLoWwgxxP6DvmKEHHX2i9b2qnfotgbxY5rQG/f0VjHwh2ZlA92x4FGHnVhsrKlYmzV9Ba+3UgRHSsKRbtm9uzkFIkGaSPdTCOMuFkLAO2khMZmOlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bejmBuPz; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bejmBuPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTHwc41DGz2yF0
	for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Oct 2024 04:27:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D5925C0578;
	Wed, 16 Oct 2024 17:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AF4C4CEC5;
	Wed, 16 Oct 2024 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729099661;
	bh=272Q2s1xa44MaO0n8oTBTXmRy6jsjZZweNSs8qCpZvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bejmBuPzVsy4XgbhsU5iXKhZ/oFvXw9OV647k+dksp2e5R82EObDVVzlwt+ePy6ex
	 x8ka188rIEmvUzA60c63yetG7cF/RynGSaWLgVJUFT84Q2MJuWOI8aqcVpjWo4jYrB
	 hnJ7Xfl7QuRX2/Xg9RwHLObGBhPlTpx68EN7GdyJldt+9DFjhBavMfrnnuNX2PIi47
	 ywKx7J6Xnb8XjnOOCBch2OlNf149br0VT8pViAOsQzL3DyXFtNJqtFo4/t2coT85Az
	 GE+aPP6VRn9kRR0zl/MaAsqiTY/2H17ZAxgE2NA7CO6xFcVJp92YtiSIJHxo0cJ4BI
	 2VTpnaoQ6+H9A==
Date: Wed, 16 Oct 2024 12:27:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add support
 for ASPEED AST27XX INTC
Message-ID: <172909966003.2068484.893211890028147027.robh@kernel.org>
References: <20241016022410.1154574-1-kevin_chen@aspeedtech.com>
 <20241016022410.1154574-2-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016022410.1154574-2-kevin_chen@aspeedtech.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 16 Oct 2024 10:24:09 +0800, Kevin Chen wrote:
> The ASPEED AST27XX interrupt controller(INTC) contains second level and
> third level interrupt controller.
> 
> INTC0:
> The second level INTC, which used to assert GIC if interrupt in INTC1 asserted.
> 
> INTC1_x:
> The third level INTC, which used to assert INTC0 if interrupt in modules
> of INTC asserted.
> 
> The relationship is like the following:
>   +-----+   +-------+     +---------+---module0
>   | GIC |---| INTC0 |--+--| INTC1_0 |---module1
>   |     |   |       |  |  |         |---...
>   +-----+   +-------+  |  +---------+---module31
>                        |
>                        |   +---------+---module0
>                        +---| INTC1_1 |---module1
>                        |   |         |---...
>                        |   +---------+---module31
>                       ...
>                        |   +---------+---module0
>                        +---| INTC1_5 |---module1
>                            |         |---...
>                            +---------+---module31
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-intc.yaml                  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

