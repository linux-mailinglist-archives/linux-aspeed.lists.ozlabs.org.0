Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E908479AD
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Feb 2024 20:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRQnr33Rrz3cJ0
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Feb 2024 06:29:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 509 seconds by postgrey-1.37 at boromir; Sat, 03 Feb 2024 06:29:29 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRQnj5WYXz3c8H
	for <linux-aspeed@lists.ozlabs.org>; Sat,  3 Feb 2024 06:29:29 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 5D9DD3000C980;
	Fri,  2 Feb 2024 20:20:48 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4DDF8406333; Fri,  2 Feb 2024 20:20:48 +0100 (CET)
Date: Fri, 2 Feb 2024 20:20:48 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.7 20/23] ARM: dts: Fix TPM schema violations
Message-ID: <20240202192048.GA22666@wunner.de>
References: <20240202183926.540467-1-sashal@kernel.org>
 <20240202183926.540467-20-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202183926.540467-20-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bcousson@baylibre.com, linux-aspeed@lists.ozlabs.org, tony@atomide.com, Bruno Thomsen <bruno.thomsen@gmail.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-omap@vger.kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Sasha,

On Fri, Feb 02, 2024 at 01:39:16PM -0500, Sasha Levin wrote:
> [ Upstream commit 8412c47d68436b9f9a260039a4a773daa6824925 ]
> 
> Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> bindings"), several issues are reported by "make dtbs_check" for ARM
> devicetrees:

You've auto-selected this commit for backporting to v6.6 and v6.7
stable kernels, but it's only really needed for v6.8 to avoid
issues reported by "make dtbs_check".

So IMO this commit can be dropped from the v6.6 and v6.7 patch queues.

Thanks,

Lukas

> The nodename needs to be "tpm@0" rather than "tpmdev@0" and the
> compatible property needs to contain the chip's name in addition to the
> generic "tcg,tpm_tis-spi" or "tcg,tpm-tis-i2c":
> 
>   tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
>         from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
> 
>   tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['tcg,tpm-tis-i2c'] is too short
>         from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
> 
> Fix these schema violations.
