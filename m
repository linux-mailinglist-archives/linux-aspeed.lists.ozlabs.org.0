Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED81819A3C
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Dec 2023 09:14:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sw5vJ1j96z3bcH
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Dec 2023 19:14:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 401 seconds by postgrey-1.37 at boromir; Wed, 20 Dec 2023 19:14:31 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sw5vC1gqdz2ykw
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Dec 2023 19:14:31 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id D4F7B10096644;
	Wed, 20 Dec 2023 09:07:33 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 81B894F3E; Wed, 20 Dec 2023 09:07:33 +0100 (CET)
Date: Wed, 20 Dec 2023 09:07:33 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Howard Chiu <howard10703049@gmail.com>
Subject: Re: [PATCH v8] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Message-ID: <20231220080733.GA30641@wunner.de>
References: <20211207094923.422422-1-howard.chiu@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207094923.422422-1-howard.chiu@quantatw.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin.Lai@quantatw.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, robh+dt@kernel.org, Howard Chiu <howard.chiu@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 05:49:24PM +0800, Howard Chiu wrote:
> Initial introduction of Facebook Bletchley equipped with
> Aspeed 2600 BMC SoC.
[...]
> +		tpmdev@0 {
> +			compatible = "tcg,tpm_tis-spi";

What's the chip used on this board?  Going forward, the DT schema for TPMs
requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".


> +			spi-max-frequency = <33000000>;
> +			reg = <0>;
> +		};
> +	};
