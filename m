Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FFFCE6A
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Nov 2019 20:00:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DW5T2bCzzF86p
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Nov 2019 06:00:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DW5M35QMzF86P
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Nov 2019 06:00:21 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id u13so5822006ote.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Nov 2019 11:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q9MEfWUdUUfPCm5vU9LQzOSz48lJcPwE7Kg/TlNRovs=;
 b=h+DP9ff6nmYfk68+EITyuNtDL20WMwfDniMMZG/vIWqxN3RP+VpLYp+UjmdU/69z/J
 EIiFIlZfH7jpJmBBFlTi/jCV0E372a7kU27cRsKFZKlVGCywnkl95Q8zeiQlcEy4yl1w
 B+E5SqbcFirRs8s9v7z75FqYAWURizEHZLEzDqItHnWmnKXdWwp4OUiEyW7q/YoM7oCy
 FvMrp2CKbJpNCKAv3LiRlX2TpO3LSgewM7Mtn/ZGLKzOlDKc3aqRFqCSvspBndyECKea
 HY7qcVQY4DANh+hukm848ukgEZi0KtQ8UBp5hFbg/hYw/h0fsgVqrU02Sjl1ZpIk/9Tj
 KNOw==
X-Gm-Message-State: APjAAAVQvm6SBKmDqFfcIrIoYflWNKpibl+9EBflfng4hmwUSmEGfMi4
 87VR4psFchAeO//spMQ0eQ==
X-Google-Smtp-Source: APXvYqwPs253ExVsUnKRmxwdF9HEpywcpmZqBHjmrgZnsSGc7MA4Jg0vyaU85b3EyxC6OBT0AAoT0Q==
X-Received: by 2002:a9d:bf0:: with SMTP id 103mr7950999oth.372.1573758018393; 
 Thu, 14 Nov 2019 11:00:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m14sm2054476otl.26.2019.11.14.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 11:00:17 -0800 (PST)
Date: Thu, 14 Nov 2019 13:00:17 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
Message-ID: <20191114190017.GA17283@bogus>
References: <1573244313-9190-1-git-send-email-eajames@linux.ibm.com>
 <1573244313-9190-6-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573244313-9190-6-git-send-email-eajames@linux.ibm.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-aspeed@lists.ozlabs.org, maz@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri,  8 Nov 2019 14:18:26 -0600, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/soc/aspeed/xdma.txt        | 24 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
