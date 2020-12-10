Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5602D50B5
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Dec 2020 03:15:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CryDp4y5xzDqvN
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Dec 2020 13:15:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CryDg6Xj6zDqjn
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 13:15:15 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id d8so3487342otq.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Dec 2020 18:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s8/BifRKs0vgQVaDEd/Wk5y6lcQlYDdTiPMPRpMuFtg=;
 b=I9P0t6JTTJvihuIfTk+8RpZ86CdLcqMIW8OiZGI+HEhQ+UbSR1TRYZ4bBR2YEJD2b1
 dTRGhO/ow/us/bCf5PZTgXZVNSjq9/SumlEHSKjoYjgkXxHjUr/suSUIYoo6F9oqvzld
 uQWc0LvZSHwTg+ZiQrJircuS++UawMr/N9rwr3SwOoZ4HVZE/6lTUnjxbkaZR4RrkJKt
 8aiWr5iCcCP+Lf0Z7ztZtaisfv34K9sNgDxWZZKxaFbz0nj2kAZBiNk//KQwda+s9UYg
 wQ0DY0L3JgMRdMGAOoRcbXTOsVrvNFgUGrr+jNPbTJXbg/t54hROsmSXWeniax3W6Dfc
 wOWw==
X-Gm-Message-State: AOAM531Nszb/QCBGopKcLZdE0HAtiRaECa5zEYa5pneqwLFqb8cIc3Ja
 vbAZR7NI235bWvHuquzMjA==
X-Google-Smtp-Source: ABdhPJxveiIz8DsomaseOKut9J4qQ8f57Gw8nD/4OTmXmici4uFWS+L6eept2gpt6irjbcANCuSlQQ==
X-Received: by 2002:a9d:2043:: with SMTP id n61mr4199358ota.254.1607566513287; 
 Wed, 09 Dec 2020 18:15:13 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k63sm707768oia.14.2020.12.09.18.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 18:15:12 -0800 (PST)
Received: (nullmailer pid 1497839 invoked by uid 1000);
 Thu, 10 Dec 2020 02:15:11 -0000
Date: Wed, 9 Dec 2020 20:15:11 -0600
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Message-ID: <20201210021511.GA1497753@robh.at.kernel.org>
References: <20201208043700.23098-1-quan@os.amperecomputing.com>
 <20201208043700.23098-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208043700.23098-2-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 allen <allen.chen@ite.com.tw>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 08 Dec 2020 11:36:59 +0700, Quan Nguyen wrote:
> Add "ampere" entry for Ampere Computing LLC: amperecomputing.com
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
