Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA4598FBA2
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2024 02:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKV752X6dz3bdX
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2024 10:39:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728002383;
	cv=none; b=kPRilGgO6u0vtaxMsBx0FTesGicwhP520eHBvGvPc7wWP44sr/F1peexMRvK2Ho32S79XXTJIze0uMDRw2TV6vmMjJaVcNWUQOi4OVe2pkJjktCHhFVjQlQ3H4ToYGzvjbu4ucLhC+BaSRY8r601rjiZSLMj46Pmwnx4IzOlPL7Xhcor0smOPXkP5JlbbEY9TzXb5jsMqiLgNDT+gvOoBvdfX8XsbtoNAuZvhQRIQpFCyZDDIrz+l1hd/bFc6BSVR2U28EzqC4qdXi18PE3mgxpAQxbtlwbtlOCvO57iq1VWyu5/QwCrrCG2SJ3wTryGhPMQzcEmAY3ZI+z1Ds0xhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728002383; c=relaxed/relaxed;
	bh=fgqfWcf//PfvrUPXmMD6/c14iNKvBJ71j3hHyMRQopY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R1syREs1b9YyQOpo6RR3X/q3/ELSylHLVJz3NpUyH5sxJVbaYuFPuwlizJnDbZtkRPswm0A3gXL3eLZRfbVjy7jzzdG8cvnMGmSfEYifgQeivSXEN3ysglPQG9r/0VW3SHRfWvzwpO6Px+WKPcIDOltsQZr/IyhFzTAP9vLP46E/BiMiZcoDUlsAd1DDrccaPxMeOQXrfE+i3gHT/EBa8qjmHGZdDrcIJLNMDi3fzGosUwECzg/Rl3oR4BiLtdu7+9GzpRSofsp6H/8XUEcBu9TuouxxZItIJB0/9y/MTrDCns0NFCL/1Txx/YUJ90uGoKAZfXZHRXhMWjgz4C7NgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fUV/0nbq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fUV/0nbq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKV712XGNz2xZj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2024 10:39:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728002379;
	bh=fgqfWcf//PfvrUPXmMD6/c14iNKvBJ71j3hHyMRQopY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fUV/0nbqcYaX1gZ6wxy3i9O+e43vTx7HlT4Hi8QHQPB1sEHom2b/md0AJKJwfF0tB
	 8rikvHjTDlljkhvxsSVN+1ap4YG9JnRBjkeUMfiZSpRASy+IuHGVYQH7iPNyA7lt5Q
	 1yHIEPwkPCNg4k2qwdUN+TYEcdPCneiQi4buAof8hEi+/ZLeZYPJ6n7exTXym/kkZT
	 Z2T/3DK6FmVvfCkZTp64cxxR2od6kcsIgNq/E15il/LQcDC3mZf1NXeuuIIfuCoto3
	 6mfqEW1K7G98mICOtNxxRnLvr59RW5TRBl3GpWler8UiibJDobbf/10szvkhoB6Sb0
	 c8XXvQCh3zOIw==
Received: from [127.0.1.1] (ppp118-210-174-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.174.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B33CE64BDC;
	Fri,  4 Oct 2024 08:39:36 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v3 0/9] Add I2C mux devices for yosemite4
Message-Id: <172800237675.81323.9277417561111727144.b4-ty@codeconstruct.com.au>
Date: Fri, 04 Oct 2024 10:09:36 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 03 Oct 2024 15:42:41 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> 
> - v3
>  - Merge the remove mctp property patch to patch 02.
>  - Order the patch to correct compatible string of max31790 before patch
>    06.
> - v2
>  - Remove mctp property on I2C Bus 15.
>  - Add required properties for IOE on fan boards.
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

