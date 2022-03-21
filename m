Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1D4E2CE7
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 16:53:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMfKZ1d71z30Q9
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 02:53:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMfKS1nTvz2yHL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 02:53:15 +1100 (AEDT)
Received: by mail-wr1-f49.google.com with SMTP id r10so21338059wrp.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Mar 2022 08:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O83M9g7HZ0bl5yKyCrG5hB98wSTjsEoQqTkE9qL5pAE=;
 b=12DbSHMuJZ0bi76zFkU+6t9IwndklJRs0yz6sLx7U2mvKIfhCJKNq+cJDNVEfFGS4h
 yhTJU24RvBiejFqgpIRNl8oISosPAkGUtKslgLKGqNuGS+YR4W2msBVLMCI6A2mMbadz
 y/YMVadhgHHx+fES0lstWeqhUtKYeJX5hAW27N5uFmY161idgJ4amTghQ5HwCT91eHbc
 +NEiAvqnivvnbR1HXOPUaYSovPhx61CKG0Rcw88a8UIlsP4Bk5HXvIv+Qe6UvoTUrRNT
 S/i5wvMXZ5iqsZFe8aD7xHSc1KvXe1ujxAyzmYnwYr5h9cSysj+3W+tTNmwqWzo7FKtc
 0jwA==
X-Gm-Message-State: AOAM5313wWhkgRExxzOF+dBdN5L4SZ2cuAKrC0NTywR84cxaY11xb/Mq
 kTp9GfDMH9VW7+t4//S856E=
X-Google-Smtp-Source: ABdhPJwMRG1dX+1zrHr+zFL5pS1NfgNXXqlzDQcAzX8jYM9eno1IAUX77WTCEo3QXtZLEbr9MvoIMg==
X-Received: by 2002:a5d:584a:0:b0:203:97f6:5975 with SMTP id
 i10-20020a5d584a000000b0020397f65975mr18579197wrf.612.1647877992260; 
 Mon, 21 Mar 2022 08:53:12 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm14184830wro.80.2022.03.21.08.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 08:53:11 -0700 (PDT)
Message-ID: <eefe6dd8-6542-a5c2-6bdf-2c3ffe06e06b@kernel.org>
Date: Mon, 21 Mar 2022 16:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties into MDIO
 nodes
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, robh+dt@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
 <20220321095648.4760-4-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321095648.4760-4-dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: BMC-SW@aspeedtech.com, stable@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/03/2022 10:56, Dylan Hung wrote:
> Add reset control properties into MDIO nodes.  The 4 MDIO controllers in
> AST2600 SOC share one reset control bit SCU50[3].
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Cc: stable@vger.kernel.org

Please describe the bug being fixed. See stable-kernel-rules.

Best regards,
Krzysztof
